class User < ActiveRecord::Base
  
  belongs_to :role
  
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation, :sale_id, :role_id
  
  validates_uniqueness_of :email
end
