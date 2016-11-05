class Property < ActiveRecord::Base
  belongs_to :property_category
  belongs_to :city
end
