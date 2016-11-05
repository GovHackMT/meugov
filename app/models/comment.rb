class Comment < ActiveRecord::Base
  # Associations
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  # Scopes
  default_scope { order('comments.created_at DESC') }
  scope :created_by, -> (user) { where(user_id: user.id) }
end
