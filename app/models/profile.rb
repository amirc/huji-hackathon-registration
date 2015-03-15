class Profile < ActiveRecord::Base
  belongs_to :user
  validates :first_name, :last_name, presence: true
  validates :academic_institute, :academic_year, :academic_degree, presence: true
  validates :experience, presence: true
end
