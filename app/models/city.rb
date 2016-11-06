class City < ActiveRecord::Base
  # Associations
  belongs_to :state
  has_many :users
  has_many :proposals
  has_many :properties

  def name_with_state
    "#{name}-#{state.acronym}"
  end

  def self.avaliable
    joins(:state).includes(:state).order(:name)
  end

  def self.report_properties(property_category_id)
    filters = select("cities.id, cities.name, cities.population, cities.pib, count(properties.id) as total_properties, (count(properties.id)/cities.population) as properties_population")
    filters = filters.joins(:state).includes(:state)
    filters = filters.joins("LEFT JOIN properties ON properties.city_id = cities.id")
    filters = filters.where("properties.property_category_id = ?", property_category_id)
    filters = filters.group("cities.id")
    filters = filters.order("properties_population DESC")
    filters
  end
end
