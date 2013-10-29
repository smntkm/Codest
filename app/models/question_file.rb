class QuestionFile < ActiveRecord::Base
  validates :name, :content_type, :data, presence: true
  
  belongs_to :question
end
