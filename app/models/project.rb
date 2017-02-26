class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :name, :user_id, presence: true
end
