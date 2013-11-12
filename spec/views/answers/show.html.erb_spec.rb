require 'spec_helper'

describe "answers/show" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :user_name => "User Name",
      :question_id => 1,
      :answer_id => 2,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Email/)
  end
end
