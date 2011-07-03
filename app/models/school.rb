class School < ActiveRecord::Base
  has_many :scholars
  
  # validations
  validates :name, :presence => true, :uniqueness => true, :allow_nil => false
  validates :default_password, :presence => true, :allow_nil => false
  
  default_scope where(['schools.is_active = ?', true]).order('schools.name')
end