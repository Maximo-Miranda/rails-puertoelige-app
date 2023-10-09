class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :response_questions
  enum :status, { pending: 0, active: 1, finished: 3 }
  enum :answer_type, { unique_choice: 0, true_or_false: 1, open: 2, multiple_choice: 3 }

  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :user_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :start_at, date: { before_or_equal_to: :end_at }
  validates :end_at, date: { after_or_equal_to: :start_at }
  validates :start_at, date: { after_or_equal_to: Proc.new { Date.today }, message: 'must be after or equal to today' }
  validates :answer_type, presence: true, inclusion: { in: Question.answer_types.keys }
end
