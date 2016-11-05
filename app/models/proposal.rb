class Proposal < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :city
  has_many :comments, as: :commentable
  has_many :votes, class_name: 'ProposalVote'

  # Validations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :city_id, presence: true

  def associations
    includes(:city)
  end

  def search(params)

  end

  def thermometer
    total_votes > 0 ? ((total_yes / total_votes) * 100) : 0
  end

  def total_votes
    votes.count
  end

  def total_yes
    votes.yes.count
  end

  def total_no
    votes.no.count
  end

  def voted?(user)
    votes.exists?(user: user)
  end
end
