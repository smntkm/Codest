class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :user_name
      t.integer :question_id, null: false
      t.integer :file_id
      t.string :email

      t.timestamps
    end
  end
end
