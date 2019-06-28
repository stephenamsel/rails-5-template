module GeneralScoping
  extend ActiveSupport::Concern  
  extend OrderAsSpecified
  included do
    scope :really_all, ->() {unscope(where: :deleted_at) if deleted_at.present?}
    scope :like, ->(field, value) {where(self.arel_table[field].matches("%#{value.strip}%"))}
    scope :like_serialized_exact, ->(field, value) {where(arel_table[field].include?(value))}
    scope :like_contains, ->(field, value) {where(arel_table[field].matches(value))}
    scope :only_as_ordered, ->(field, arr) {
      where(field.to_s => arr).order_as_specified(field.to_s => arr.compact.uniq)
    }
    scope :only_one, ->(col_name){where(id: self.select(:id, col_name).group(col_name).maximum(:id).values)}
    
    def just_created?
      self.created_at == self.updated_at
      #Used for sending queued emails that depend upon the model already being in the db: 
      #Must be done after_commit because they are on a separate thread, but some we only want upon creation
    end
    def just_destroyed?
      self.deleted_at == self.updated_at
    end
    
    def self.order_by_presence(field, ord = :asc, null_last = nil, relation = self)
      ad = (ord == :desc ? "DESC" : "ASC" )
      a = 1
      b = 2
      c = 3
      if null_last
        c = 2
        b = 3
      end
      relation.order("(CASE WHEN #{field} THEN #{a} WHEN #{field} IS NULL THEN #{b} ELSE #{c} END) #{ad}")
    end
    

    def self.efficient_group(index, values) #does not return Relation anyways
      #groups arrays of "values" by an "index". Values must include a unique combination
      #values is an array of symbols, index is a symbol
      #all sumbols are for columns  
      if values.exclude?(:id) then values.push(:id) end #Require uniqueness
      grouped = self.select(index, *values).group(*values).maximum(index)
      if [DateTime, Time].include?(grouped[grouped.keys.first].class)
        grouped.each do |k, v|
          grouped[k] = v.localtime
        end  
      end      
      out = {}
      grouped.each do |key, value|
        out[value] ||= []
        out[value].push(key)
      end
      if values.length > 1
        out.each do |key, vals|
          vals_hashes = []
          vals.length.times do |i|
            #loses duplicates
            vals[i] = vals[i].each_with_index.map{|x, j| [values[j], x]}.to_h
          end
        end
      end
      out.default = []
      return out
    end
  end
  
end