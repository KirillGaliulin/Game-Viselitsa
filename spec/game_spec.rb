require_relative '../game.rb'

describe Game do
  context 'когда загаданое слово отгадали без ошибок' do
    before do
      @game = Game.new('файл')
      @game.next_step('ф')
      @game.next_step('а')
      @game.next_step('й')
      @game.next_step('л')
    end

    it 'слово отгадали верно' do
      expect(@game.errors).to eq 0 # 0 ошибок
      expect(@game.status).to eq 1 # игра выиграна
    end
  end

  context 'когда загаданная буква встречается дважды' do
    before do
      @game = Game.new('счастье')
      @game.next_step('с')
      @game.next_step('ч')
      @game.next_step('а')
      @game.next_step('т')
      @game.next_step('ь')
      @game.next_step('е')
    end

    it 'слово отгадали верно' do
      expect(@game.errors).to eq 0 # 0 ошибок
      expect(@game.status).to eq 1 # игра выиграна
    end
  end

  context 'когда загаданное слово отгадали, но с 1 ошибкой' do
    before do
      @game = Game.new('радость')
      @game.next_step('р')
      @game.next_step('а')
      @game.next_step('д')
      @game.next_step('о')
      @game.next_step('с')
      @game.next_step('т')
      @game.next_step('й')
      @game.next_step('ь')
    end

    it 'слово отгадали верно' do
      expect(@game.errors).to eq 1 # 1 ошибка
      expect(@game.status).to eq 1 # игра выиграна
    end
  end

  context 'когда загаданное слово отгадали, но с 6 ошибками' do
    before do
      @game = Game.new('радость')
      @game.next_step('р')
      @game.next_step('а')
      @game.next_step('д')
      @game.next_step('о')
      @game.next_step('с')
      @game.next_step('т')
      @game.next_step('н')
      @game.next_step('ц')
      @game.next_step('у')
      @game.next_step('к')
      @game.next_step('е')
      @game.next_step('й')
      @game.next_step('ь')
    end

    it 'слово отгадали верно' do
      expect(@game.errors).to eq 6 # 6 ошибкар
      expect(@game.status).to eq 1 # игра выиграна
    end
  end

  context 'когда загаданное слово не отгадали - 7 ошибок' do
    before do
      @game = Game.new('счастье')
      @game.next_step('й')
      @game.next_step('ц')
      @game.next_step('к')
      @game.next_step('н')
      @game.next_step('г')
      @game.next_step('ш')
      @game.next_step('ы')
    end

    it 'слово отгадали верно' do
      expect(@game.errors).to eq 7 # 7 ошибок
      expect(@game.status).to eq -1 # игра проиграна
    end
  end

  context 'когда загаданная буква вводится второй раз и слово отгадывается до конца' do
    before do
      @game = Game.new('радость')
      @game.next_step('р')
      @game.next_step('р')
      @game.next_step('а')
      @game.next_step('д')
      @game.next_step('о')
      @game.next_step('с')
      @game.next_step('т')
      @game.next_step('ь')
    end

    it 'слово отгадали верно' do
      expect(@game.errors).to eq 0 # 0 ошибок
      expect(@game.status).to eq 1 # игра выиграна
    end
  end

  context 'когда загаданная буква вводится второй раз' do
    before do
      @game = Game.new('радость')
      @game.next_step('р')
      @game.next_step('р')
    end

    after { exit }

    it 'игра не завершается, кол-во ошибок не изменяется' do
      expect(@game.errors).to eq 0
      expect(@game.status).to eq 0
    end
  end
end