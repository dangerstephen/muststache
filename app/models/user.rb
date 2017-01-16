class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" },default_url: "default.png"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates :fullname, presence: true, length: { maximum: 50 }

  has_many :spaces
  has_many :reservations
  has_many :conversations, :foreign_key => :sender_id

  # very happy that you were able to get both FB and google login done - very useful in the real world!
  def self.from_omniauth(auth)
  user = User.where(email: auth.info.email).first

  if user
    return user
  else
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.fullname = auth.info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
    end
  end
end

end
