class ProposalVote < ActiveRecord::Base
  # Enum
  enum answer: [:yes, :no]

  # Associations
  belongs_to :proposal, counter_cache: true
  belongs_to :user

  # Validations
  validates :proposal_id, presence: true
  validates :user_id, presence: true
  validates :answer, presence: true
end
