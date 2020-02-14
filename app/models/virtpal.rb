class Virtpal < ActiveRecord::Base

  belongs_to :creator

  validates :name, presence: true
  
end