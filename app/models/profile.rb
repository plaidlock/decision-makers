class Profile < ActiveRecord::Base
  SPP = 1
  CPP = 2

  TYPES = [['Starting Point Profile', SPP], ['Check Point Profile', CPP]]

  has_many :assignments
  has_many :snapshots
  has_many :questions,
    :through => :snapshots

  default_scope includes(:questions)

  # validations
  validates :name, :presence => true, :allow_nil => false

  def method_missing(m, *args, &block)
    method = m.to_s
    return self.snapshots[$1.to_i-1] if method =~ /snapshot_(.+)/
    super
  end
end