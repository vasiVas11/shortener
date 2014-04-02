class Shorter < ActiveRecord::Base
  attr_accessible :description, :identifier, :url, :status
  validates :identifier, :uniqueness => true
  validates :url, presence: true,
                  length: {minimum: 10}

end
