class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Enums
  enum role: [:citizen, :government, :admin]

  # Associations
  belongs_to :city

  # Validations
  validates :city_id, presence: true

  def nickname
    name? ? self.name : self.email
  end
end
