class User < ApplicationRecord
  attr_writer :login
  belongs_to :organization, optional: true
  has_many :shifts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => { email: true, login: false }

  def login
    @login || self.name || self.email
  end
end
