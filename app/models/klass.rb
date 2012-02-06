class Klass < ActiveRecord::Base
  has_many :scholars

  validates :name, :default_password, :presence => true, :allow_nil => false

  def to_s
    self.name
  end
end