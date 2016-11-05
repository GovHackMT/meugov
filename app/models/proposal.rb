class Proposal < ActiveRecord::Base
  # Enuns
  enum status: [:open]

  # Associations
  belongs_to :proposal_category
  belongs_to :user
  belongs_to :city
  has_many :comments, as: :commentable
  has_many :votes, class_name: 'ProposalVote'

  # Validations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :city_id, presence: true
  validates :proposal_category_id, presence: true

  # Scopes
  scope :popular, order('proposal_votes_count DESC')

  def self.associations
    joins(:city, :user, :proposal_category).includes(:city, :user, :proposal_category)
  end

  def self.search(params)
    filters = associations
    filters = filters.where("proposals.title LIKE '%%%s%%' OR proposals.content LIKE '%%%s%%'", params[:q], params[:q]) if params[:q].present?
    filters = filters.where(city_id: params[:city_id]) if params[:city_id].present?
    filters = filters.where("users.role = ?", params[:role]) if params[:role].present?
    filters = filters.paginate(page: params[:page])
    filters
  end

  def update_thermometer
    self.thermometer = total_votes > 0 ? ((total_yes / total_votes) * 100) : 0
    self.save
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
