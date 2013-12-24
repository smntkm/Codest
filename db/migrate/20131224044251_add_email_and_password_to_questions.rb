class AddEmailAndPasswordToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :email, :string
    add_column :questions, :password, :string 
  end

  def down
    remove_column :questions, :email
    remove_column :questions, :password
  end
end
