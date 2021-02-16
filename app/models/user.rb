class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Un utilisateur peut participer à plusieurs événements au travers des participations.
  has_many :attendances
  has_many :events, through: :attendances

  #validates :description, presence: true
  #validates :first_name, presence: true
  #validates :last_name, presence: true

  ##apres la creation d'un utilisateur envoyé un mail 
  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

end
