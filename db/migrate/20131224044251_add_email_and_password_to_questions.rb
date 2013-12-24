class AddEmailAndPasswordToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :email, :string
    add_column :questions, :hash_password, :string 
  end

  def down
    remove_column :questions, :email
    remove_column :questions, :hash_password
  end
end
