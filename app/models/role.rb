class Role < ActiveRecord::Base

  attr_accessible :name
  validates :name, presence: true, uniqueness: true

  has_many :users

  def self.get_admin_id
    role = self.find_by_name 'admin'
    return role.id
  end
end
