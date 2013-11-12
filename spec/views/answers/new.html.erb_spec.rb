require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :user_name => "MyString",
      :question_id => 1,
      :answer_id => 1,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answers_path, "post" do
      assert_select "input#answer_user_name[name=?]", "answer[user_name]"
      assert_select "input#answer_question_id[name=?]", "answer[question_id]"
      assert_select "input#answer_answer_id[name=?]", "answer[answer_id]"
      assert_select "input#answer_email[name=?]", "answer[email]"
    end
  end
end
