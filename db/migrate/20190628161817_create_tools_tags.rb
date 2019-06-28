class CreateToolsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tools_tags do |t|
      t.references :obj, polymorphic: true
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
