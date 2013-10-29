class ModffyQuestionFile < ActiveRecord::Migration
  def up
    add_column :question_files, :question_id, :Integer
  end

  def down
    remove_column :question_files, :question_id
  end
end
