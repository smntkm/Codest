class ReportsController < ApplicationController
  def create
    file_create
    render "report"
  end

  private
  def file_create
    answer = Answer.find(params[:id])
    question = Question.find(answer.question_id)
    
    t = Time.now.strftime("%Y%m%d%H%M%S%L") 
    exe_file = Tempfile.new(["#{t}", ".rb"], "./tmp")

    #exe_file.write(answer.user_file.data)
    #exe_file.write(question.user_file.data)
    exe_file.write("class Sample\n  def cat str1, str2\n    \"\#{str1}\#{str2}\"\n  end\nend\nrequire \"test/unit\"\n\nclass Sample_test < Test::Unit::TestCase\n  def test_aa_bb\n    s = Sample.new\n    actual = s.cat(\"aa\", \"bb\")\n    assert_equal(\"aabb\", actual)\n  end\n\n  def test_aa_11\n    s = Sample.new\n    actual = s.cat(\"aa\", \"bb\")\n    assert_equal(\"aa11\", actual)\n  end\nend\n")
    exe_file.rewind

    test_exe exe_file
  end

  def test_exe exe_file
    @result = Open3.capture3("ruby #{File.path(exe_file)}")
  end
end
