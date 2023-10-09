class Answer < ApplicationRecord
  belongs_to :question
  enum :status, { active: 0, inactive: 1 }

  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true, inclusion: { in: Answer.statuses.keys }
  validates :question_id, presence: true
end
