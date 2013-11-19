class QuestionFile < ActiveRecord::Base
  validates :name, :content_type, :data, presence: true
  
  belongs_to :question

  def send_file file
   self.name = file.original_filename
   self.content_type = file.content_type
   self.data = file.read
  end
end
