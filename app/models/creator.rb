class Creator < ActiveRecord::Base

  has_many :virtpal

  has_secure_password

  validates :email, presence: true, uniqueness: true

end