require 'spec_helper'

describe "question_files/index" do
  before(:each) do
    assign(:question_files, [
      stub_model(QuestionFile,
        :name => "Name",
        :content_type => "Content Type",
        :data => ""
      ),
      stub_model(QuestionFile,
        :name => "Name",
        :content_type => "Content Type",
        :data => ""
      )
    ])
  end

  it "renders a list of question_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
