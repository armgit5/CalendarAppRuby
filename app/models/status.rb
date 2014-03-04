class Status < ActiveRecord::Base
  has_many :pendings
end
