class Task < ApplicationRecord
  PLACEHOLDERS = ['Walk the dog...',
                  'Book tickets to Amsterdam...',
                  'Book that Madrid\'s hotel...',
                  'Take out the garbage...',
                  'Finish my super project...',
                  'Find my dream job...'].freeze

  validates :title, presence: true
  validates :priority, presence: true

  belongs_to :user
  belongs_to :group
end
