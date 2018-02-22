class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if self.nausea > self.happiness
      return "sad"
    else
      return "happy"
    end
  end

end
