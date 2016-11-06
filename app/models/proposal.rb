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
  scope :popular, -> { order('proposal_votes_count DESC').order('thermometer DESC') }
  scope :government, -> { where('users.role = ?', User.roles[:government]) }
  scope :society, -> { where('users.role <> ?', User.roles[:government]) }

  def self.associations
    joins(:city, :user, :proposal_category).includes(:city, :user, :proposal_category)
  end

  def self.search(params)
    filters = associations
    filters = filters.where("proposals.title LIKE '%%%s%%' OR proposals.content LIKE '%%%s%%'", params[:q], params[:q]) if params[:q].present?
    filters = filters.where(city_id: params[:city_id]) if params[:city_id].present?
    filters = filters.where(user_id: params[:user_id]) if params[:user_id].present?
    filters = filters.where(proposal_category_id: params[:proposal_category_id]) if params[:proposal_category_id].present?
    filters = filters.government if params[:role] == 'government'
    filters = filters.society if params[:role] == 'society'

    filters = filters.paginate(page: params[:page])
    filters
  end

  def self.avaliable
    associations.open
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def update_thermometer
    self.thermometer = total_votes > 0 ? ((total_yes.to_f / total_votes.to_f) * 100) : 0
    self.save
  end

  def update_count_views
    update count_views: (self.count_views + 1)
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

  def self.report(params)
    filters = self
    filters = filters.joins(:city, :proposal_category)
    filters = filters.group("cities.name, proposal_categories.name")
    filters = filters.select("cities.name city, cities.pib city_pib, cities.population city_population, proposal_categories.name AS category, count(proposals.id) as total")
    filters = filters.where("proposals.proposal_category_id = ?", params[:proposal_category_id]) if params[:proposal_category_id].present?
    filters = filters.where("proposals.city_id = ?", params[:city_id]) if params[:city_id].present?
    filters
  end
end
