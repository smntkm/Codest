module IllegalMethod
  Illegal_question_word = ["`", "Dir", "File", "IO", "system", "systemu", "Open3", "popen", "capture3", "Kernel", "Marshal", "fileutils", "find", "pathname", "tempfile", "tmpdir", "cgi", "gserver", "ipaddr", "net/ftp", "net/http", "net/https", "net/imap", "open-uri", "openssl", "net/", "uri", "socket", "etc", "syslog"]

  Illegal_answer_word = ["`", "Dir", "File", "IO", "system", "systemu", "Open3", "popen", "capture3", "Kernel", "Marshal", "require"]
  protected
  def illegal_question? data
    isIllegal = false
    Illegal_question_word.each do |word|
      isIllegal = data.include? word
    end
    return isIllegal
  end

  def illegal_answer? data
    isIllegal = false
    Illegal_answer_word.each do |word|
      isIllegal = data.include? word
    end
    return isIllegal
  end
end
