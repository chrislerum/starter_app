class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, presence: true


  def full_name
    [first_name, last_name].join(' ')
  end

end
