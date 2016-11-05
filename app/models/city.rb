class City < ActiveRecord::Base
  # Associations
  belongs_to :state
  has_many :users
  has_many :proposals
end
