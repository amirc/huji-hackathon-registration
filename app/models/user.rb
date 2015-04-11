class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile

  validates_associated :profile

  belongs_to :group

  def is_waiting
    profile.is_waiting
  end

  def self.looking_for_team
    where(group: nil)
  end
end
