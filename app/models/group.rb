class Group < ActiveRecord::Base
  belongs_to :admin, class_name: 'User'
  has_many :users
  has_many :profiles, through: :users

  validates_presence_of :name

  def self.for_public
    where is_looking_for: true
  end
end
