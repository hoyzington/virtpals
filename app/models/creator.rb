class Creator < ActiveRecord::Base

  has_many :virtpal

  has_secure_password

  validates :username, presence: true, uniqueness: true

end