class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  # Enums
  enum role: [:citizen, :government, :admin]

  # Associations
  belongs_to :city

  # Validations
  #validates :city_id, presence: true

  def nickname
    name? ? self.name : self.email
  end

  def self.from_omniauth(auth)
    user = User.find_by_email auth.info.email
    if user
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else
      user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        #user.image = auth.info.image # assuming the user model has an image
      end
    end
    user
  end
end
