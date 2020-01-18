class CreateAnswerChoice < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.text :choice_body
      t.integer :question_id
    end
  end
end
