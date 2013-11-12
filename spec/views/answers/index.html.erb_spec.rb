require 'spec_helper'

describe "answers/index" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer,
        :user_name => "User Name",
        :question_id => 1,
        :answer_id => 2,
        :email => "Email"
      ),
      stub_model(Answer,
        :user_name => "User Name",
        :question_id => 1,
        :answer_id => 2,
        :email => "Email"
      )
    ])
  end

  it "renders a list of answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
