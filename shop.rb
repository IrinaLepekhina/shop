if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__)

require current_path + '/lib/product.rb'
require current_path + '/lib/book.rb'
require current_path + '/lib/film.rb'
require current_path + '/lib/exception.rb'
require current_path + '/lib/assort_reader.rb'
require current_path + '/lib/creator.rb'

#########
## Читает ассортимент из файла
# Сделать, чтобы читал N количество файлов
# Сделать, чтобы читал несколько книг из файла

assortiment = []

begin
  lines = AssortReader.new.read_from_files(current_path + '/data/books/01.txt').to_a
  rescue OpenException
  abort "Файл с ассортиментом не найден!"
end

assortiment << Creator.for(lines)

begin
  lines = AssortReader.new.read_from_files(current_path + '/data/films/01.txt').to_a
  rescue OpenException
  abort "Файл с ассортиментом не найден!"
end

assortiment << Creator.for(lines)

puts "это прочитано из файлов:"
puts assortiment

#########
## можно обнавлять информацию о фильме.книге

film = Film.new(title: 'Матрица', director: 'братья Вачовски', price: 700)
film.year = 1999
film.update(amount: 7)

#########
## витрина
puts
puts "обновлённый список:"
assortiment << film
puts 'Вот какие товары у нас есть:'
assortiment.each { |product| puts product }