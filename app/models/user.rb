class User < ActiveRecord::Base

  has_many:tasks

  validates :first_name, :last_name, :username, :password, presence: true
  validates :username, uniqueness: true
  
end
