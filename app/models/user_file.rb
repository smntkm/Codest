class UserFile < ActiveRecord::Base
  validates :name, :content_type, :data, presence: true
  
  belongs_to :question, class_name: "Question"
  belongs_to :answer, class_name: "Answer" 

  def send_file file
   self.name = file.original_filename
   self.content_type = file.content_type
   self.data = file.read
  end
end
