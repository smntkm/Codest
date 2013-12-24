class AddEmailAndPasswordToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :email, :String
    add_column :questions, :password, :String 
  end

  def down
    remove_column :questions, :email
    remove_column :questions, :password
  end
end
