class CreateResponseQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :response_questions do |t|
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps

      t.index [:question_id, :answer_id, :user_id], unique: true, name: 'index_resp_questions_on_q_a_u'
    end
  end
end
