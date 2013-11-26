class Question < ActiveRecord::Base
  validates :title, :content , presence: true
 
  has_one :user_file, class_name: "UserFile"
  has_many :answers
  
  accepts_nested_attributes_for :file

  def file_attributes=(data)
    q_data = data[:data]
    self.build_file
    self.file.send_file q_data
  end
end
