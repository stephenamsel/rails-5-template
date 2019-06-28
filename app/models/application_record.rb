class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  has_many :tags, class_name: 'Tools::Tag', as: :obj
end
