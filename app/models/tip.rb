class Tip < ActiveRecord::Base
  has_and_belongs_to_many :snapshots

  validates :title, :content, :presence => true
end