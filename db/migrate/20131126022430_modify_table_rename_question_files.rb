class ModifyTableRenameQuestionFiles < ActiveRecord::Migration
  def up
    rename_table :question_files, :user_files
  end

  def down
    rename_table :user_files, :question_files
  end
end
