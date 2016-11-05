class Property < ActiveRecord::Base
  # Associations
  belongs_to :property_category
  belongs_to :city

  # Validations
  validates :name, presence: true
  validates :city_id, presence: true
end
