class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def as_json
    { id: self.id, email: self.email }
  end

  private

  Warden::Manager.after_set_user do |user, auth, opts|
    user.access_token = JsonWebToken.encode(user.as_json)
    user.save
  end

  Warden::Manager.before_logout do |user, auth, opts|
    user.access_token = nil
    user.save
  end
end
