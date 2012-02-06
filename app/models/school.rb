class School < ActiveRecord::Base
  has_many :scholars

  # validations
  validates :name, :presence => true, :uniqueness => true, :allow_nil => false

  default_scope where(['schools.is_active = ?', true]).order('schools.name')

  def to_s
    self.name
  end
end