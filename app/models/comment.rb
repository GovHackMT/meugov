class Comment < ActiveRecord::Base
  # Associations
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  # Scopes
  default_scope { order('comments.created_at DESC') }

  # Valitions
  validates :commentable_type, presence: true
  validates :commentable_id, presence: true
  validates :content, presence: true
end
