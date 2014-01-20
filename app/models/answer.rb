class Answer < ActiveRecord::Base
  validates :user_name, :question, :user_file, :email, presence: true

  belongs_to :user_file
  belongs_to :question

  accepts_nested_attributes_for :user_file

  def user_file_attributes= data
    u_data = data[:data]
    self.build_user_file
    self.user_file.send_file u_data
  end
end
