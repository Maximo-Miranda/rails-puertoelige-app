class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.string :body
      t.text :description #TODO: remove description
      t.integer :status, default: 0
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
