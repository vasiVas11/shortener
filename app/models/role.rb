class Role < ActiveRecord::Base

  attr_accessible :name
  validates :name, presence: true, uniqueness: true

  has_many :users

  def self.get_admin_id
    role = self.find_by_name 'admin'
    if role
      return role.id
    end
    return -1
  end
end
