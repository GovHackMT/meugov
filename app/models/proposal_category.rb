class ProposalCategory < ActiveRecord::Base
  # Associations
  has_many :proposals

  # Validations
  validates :name, presence: true

  def self.with_proposals
    self.joins(:proposals).group(:id)
  end
end
