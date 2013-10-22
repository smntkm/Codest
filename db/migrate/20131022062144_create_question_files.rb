class CreateQuestionFiles < ActiveRecord::Migration
  def change
    create_table :question_files do |t|
      t.string :name
      t.string :content_type
      t.binary :data

      t.timestamps
    end
  end
end
