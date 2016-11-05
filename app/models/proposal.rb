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

  def self.associations
    joins(:city, :user).includes(:city, :user)
  end

  def self.search(params)
    filters = associations
    filters = filters.where("proposals.title LIKE '%%%s%%' OR proposals.content LIKE '%%%s%%'", params[:q], params[:q]) if params[:q].present?
    filters = filters.where(city_id: params[:city_id]) if params[:city_id].present?
    filters = filters.where("users.role = ?", params[:role]) if params[:role].present?
    filters = filters.paginate(page: params[:page])
    filters
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
