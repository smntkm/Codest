class ModifyColumnNameAnswersFileId < ActiveRecord::Migration
  def up
    rename_column :answers, :file_id, :user_file_id 
  end

  def down
    rename_column :answers, :user_file_id, :file_id
  end
end
