class ProposalCategory < ActiveRecord::Base
  # Associations
  has_many :proposals

  # Validations
  validates :name, presence: true
end
