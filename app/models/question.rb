class Question < ActiveRecord::Base
  validates :title, :content , presence: true
 
  belongs_to :user_file
  has_many :answers
  
  accepts_nested_attributes_for :user_file

  def user_file_attributes=(data)
    q_data = data[:data]
    self.build_user_file
    self.user_file.send_file q_data
  end

  def password=(pass)
    
    p Password.create(pass)
    self.password = pass
    #self.password = Password.create(pass)
  end
end
