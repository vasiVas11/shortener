class Shorter < ActiveRecord::Base
  attr_accessible :description, :identifier, :url, :status, :user_id
  validates :identifier, :uniqueness => true
  validates :url, presence: true,
                  length: {minimum: 10}

  belongs_to :user

  #self.per_page = 10

end
