class City < ActiveRecord::Base
  # Associations
  belongs_to :state
  has_many :users
  has_many :proposals

  def name_with_state
    "#{name}-#{state.acronym}"
  end
end
