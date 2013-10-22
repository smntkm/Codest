require 'spec_helper'

describe "question_files/show" do
  before(:each) do
    @question_file = assign(:question_file, stub_model(QuestionFile,
      :name => "Name",
      :content_type => "Content Type",
      :data => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Content Type/)
    rendered.should match(//)
  end
end
