class WordReader
  def read_from_file(file_name)
    begin
      f = File.new(file_name)
      lines = f.readlines
      f.close
    rescue SystemCallError
      # Если файл со словами не удалось открыть - закрыть программу и сообщить об этом польз.
      abort "Файл со словами не найден!"
    end

    return lines.sample.chomp
  end
end