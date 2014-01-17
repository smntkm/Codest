class ReportsController < ApplicationController
  def new
  end

  def create
    report_create
    render "report"
  end

  private
  def report_create
    reportfile = params[:data]
    question = Question.find(params[:question_id])
    
    #一意性を上げるためのタイムスタンプ
    time = Time.now.strftime("%Y%m%d%H%M%S%L")
    #一意のテンプファイルの作成
    exe_file = Tempfile.new(["#{time}", ".rb"], "./tmp")

    #それぞれのファイルの書き込み
    File.open(exe_file, "ab") {|f| f.write(reportfile.read) }
    File.open(exe_file, "ab") {|f| f.write(question.user_file.data)  }
    
    exe_test exe_file
  end

  def exe_test exe_file
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
end
