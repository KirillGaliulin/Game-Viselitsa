class ResultPrinter
  def initialize
    @status_image = []
    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7 do
      file_name = current_path + "/image/#{counter}.txt"

      begin
        f = File.new(file_name)
        @status_image << f.read
        f.close
      rescue SystemCallError
        @status_image << "\n[ Изображение не найдено ]\n"
      end

      counter += 1
    end
  end

  def print_status(game)
    cls
    puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"
    print_viselitsa(game.errors)
  
    if game.errors >= 7
      puts 'Вы проиграли :('
    else
      if game.letters.uniq.size == game.good_letters.size
        puts "Поздравляем! Вы выиграли! \n\n"
      else
        puts "У вас осталось попыток: " + (7-game.errors).to_s
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ''
  
    for letter in letters do
      if good_letters.include?(letter)
        result += letter + " "
      else
        result += "__ "
      end
    end
  
    return result
  end

  def cls
    system "clear" or system "cls"
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end
end