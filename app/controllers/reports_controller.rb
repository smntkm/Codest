class ReportsController < ApplicationController
  def create
    file_create
    answer_delete
    render "report"
  end

  private
  def file_create
    answer = Answer.find(params[:id])
    question = Question.find(answer.question_id)
    
    #一意性を上げるためのタイムスタンプ
    time = Time.now.strftime("%Y%m%d%H%M%S%L")
    #一意のテンプファイルの作成
    exe_file = Tempfile.new(["#{time}", ".rb"], "./tmp")

    #それぞれのファイルの書き込み
    File.open(exe_file, "ab") {|f| f.write(answer.user_file.data) }
    File.open(exe_file, "ab") {|f| f.write(question.user_file.data)  }
    
    #ファイルポインタを先頭にする
    exe_file.rewind

    test_exe exe_file
  end

  def test_exe exe_file
    @result = Open3.capture3("ruby #{File.path(exe_file)}")
    result_format
  end

  def result_format
    @result[0].gsub!(/Failure/, "失敗")
    @result[0].gsub!(/expected but was/, "期待値")
    @result[0].gsub!(/tests/, "テスト")
    @result[0].gsub!(/assertions/, "アサーション")
    @result[0].gsub!(/failures/, "失敗")
    @result[0].gsub!(/errors/, "エラー")
    @result[0].gsub!(/skips/, "スキップ")
  end

  def answer_delete
    Answer.destroy(params[:id])
  end
end
