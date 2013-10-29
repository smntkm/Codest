class QuestionFile < ActiveRecord::Base
  validates :name, :content_type, :data, presence: true
end
