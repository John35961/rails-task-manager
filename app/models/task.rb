class Task < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true
end
