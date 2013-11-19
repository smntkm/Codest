class Question < ActiveRecord::Base
  validates :title, :content , presence: true
 
  belongs_to :file, class_name: "QuestionFile"

  accepts_nested_attributes_for :file

  def file_attributes=(data)
    q_data = data[:data]
    self.build_file
    self.file.send_file q_data
  end
end
