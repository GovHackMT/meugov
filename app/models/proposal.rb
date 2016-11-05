class Proposal < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :city
  has_many :comments, as: :commentable

  # Validations
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :city_id, presence: true
end
