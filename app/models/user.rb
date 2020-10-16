class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :tickets, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def owner_of?(ticket)
    ticket.user_id == self.id
  end

end
