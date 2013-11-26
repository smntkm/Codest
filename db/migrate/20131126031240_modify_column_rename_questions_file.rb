class ModifyColumnRenameQuestionsFile < ActiveRecord::Migration
  def up
    rename_column :questions, :file_id, :user_file_id
  end

  def down
     rename_column :questions, :user_file_id, :file_id
  end
end
