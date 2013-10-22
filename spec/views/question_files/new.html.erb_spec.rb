require 'spec_helper'

describe "question_files/new" do
  before(:each) do
    assign(:question_file, stub_model(QuestionFile,
      :name => "MyString",
      :content_type => "MyString",
      :data => ""
    ).as_new_record)
  end

  it "renders new question_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_files_path, "post" do
      assert_select "input#question_file_name[name=?]", "question_file[name]"
      assert_select "input#question_file_content_type[name=?]", "question_file[content_type]"
      assert_select "input#question_file_data[name=?]", "question_file[data]"
    end
  end
end
