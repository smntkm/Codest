require "bcrypt" 

class Question < ActiveRecord::Base
  attr_accessor :password

  validates :title, :content, :hash_password, :email, presence: true
 
  belongs_to :user_file
  has_many :answers
  
  accepts_nested_attributes_for :user_file

  def user_file_attributes=(data)
    q_data = data[:data]
    self.build_user_file
    self.user_file.send_file q_data
  end

  def password=(pass)
    self.hash_password = BCrypt::Password.create(pass)
  end

  def same_password? password
    BCrypt::Password.new(self.hash_password) == password
  end
end
