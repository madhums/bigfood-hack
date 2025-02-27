class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :invitable, :database_authenticatable,
    :recoverable, :rememberable, :validatable, :registerable
end
