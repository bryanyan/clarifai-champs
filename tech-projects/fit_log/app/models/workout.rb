class Workout < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :tag, presence: true
  validates :exercise1, presence: true, length: { maximum: 140 }
  validates :exercise2, presence: true, length: { maximum: 140 }
  validates :exercise3, presence: true, length: { maximum: 140 }
  validates :exercise4, presence: true, length: { maximum: 140 }
  validates :exercise5, presence: true, length: { maximum: 140 }
  validates :exercise6, presence: true, length: { maximum: 140 }
end