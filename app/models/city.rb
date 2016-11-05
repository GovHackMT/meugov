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
    filters = self
    filters = filters.joins(:state).includes(:state)
  end
end
