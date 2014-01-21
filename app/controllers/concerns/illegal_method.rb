module IllegalMethod
  Illegal_question_word = ["`", "Dir", "File", "IO", "system", "systemu", "Open3", "popen", "capture3", "Kernel", "Marshal", "fileutils", "find", "pathname", "tempfile", "tmpdir", "cgi", "gserver", "ipaddr", "net/ftp", "net/http", "net/https", "net/imap", "open-uri", "openssl", "net/", "uri", "socket", "etc", "syslog"]

  Illegal_qnaswer_word = ["`", "Dir", "File", "IO", "system", "systemu", "Open3", "popen", "capture3", "Kernel", "Marshal", "require"]
  protected
  def illegal_question? data
    p "aaaa"
  end

  def illegal_answer? data
    p "bbbb"
  end
end
