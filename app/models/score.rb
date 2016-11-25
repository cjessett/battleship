class Score < ApplicationRecord
  belongs_to :user
  validates_presence_of :result, :user
  scope :top, ->(n = 10) { order(result: :desc).first(n) }
end
