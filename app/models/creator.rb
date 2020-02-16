class Creator < ActiveRecord::Base

  has_many :virtpals

  has_secure_password

  validates :username, presence: true, uniqueness: true

end