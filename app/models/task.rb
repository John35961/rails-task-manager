class Task < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true

  belongs_to :user
end
