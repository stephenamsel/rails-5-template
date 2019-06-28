class Tools::Tag < ApplicationRecord
  belongs_to :obj, polymorphic: true
end
