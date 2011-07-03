class Klass < ActiveRecord::Base
  has_many :scholars
  
  validates :name, :presence => true
end