class User < ActiveRecord::Base
  TYPES = %w(Administrator Scholar)

  validates :username, :password, :type, :first_name, :last_name, :presence => true, :allow_nil => false
  validates :username, :uniqueness => true

  default_scope where(['users.is_active = ?', true]).order('users.last_name, users.first_name')

  def name
    [self.first_name, self.last_name].join(' ')
  end
end