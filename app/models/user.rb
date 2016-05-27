class User < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :trips

  # Transporteur
  has_many :missions, through: :trips
  has_many :transporter_reviews, through: :missions, source: :review

  # Envoyeur
  has_many :sender_reviews, class_name: "Review"

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def one_picture_url
    if self.photo.url
      self.photo.url
    elsif self.picture
      self.picture
    else
      "http://placehold.it/30x30"
    end
  end
end
