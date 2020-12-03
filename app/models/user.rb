class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :access_token
  after_create :create_access_token

  private

  def create_access_token
    self.access_token = JsonWebToken.encode(self.as_json)
  end
end
