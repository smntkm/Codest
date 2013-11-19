class ModifyQuestionAndQuestionFileColumn < ActiveRecord::Migration
  def up
    remove_column :question_files, :question_id
    add_column :questions, :file_id, :integer
  end

  def down 
    remove_column :questions, :file_id
    add_column :question_files, :question_id, :integer
  end
end
