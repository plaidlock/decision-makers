class Profile < ActiveRecord::Base
  SPP = 1
  CPP = 2
  
  has_many :snapshots
  has_many :assignments
    
  # validations
  validates :name, :text, :presence => true, :allow_nil => false
end