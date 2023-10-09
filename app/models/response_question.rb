class ResponseQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :user

  validates :question_id, uniqueness: { scope: [:answer_id, :user_id] }
  validates :answer_id, uniqueness: { scope: [:question_id, :user_id] }
  validates :user_id, uniqueness: { scope: [:question_id, :answer_id] }
end
