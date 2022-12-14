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

# можно обновлять и update
film = Film.new(title: 'Матрица', director: 'братья Вачовски', price: 700)
film.year = 1999
film.update(amount: 7)

assortiment = []
assortiment << film

book = Book.from_file(current_path + "/data/books/01.txt")
film = Film.from_file(current_path + "/data/films/01.txt")
assortiment << film
assortiment << book

puts 'Вот какие товары у нас есть:'
assortiment.each { |product| puts product }
