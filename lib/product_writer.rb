# frozen_string_literal: true

class ProductWriter
  def get_attr(product_class)
    puts 'Стоимость в рублях:'
    price = 350
    puts 'Осталось на складе шт:'
    amount = 7

    case product_class
    when 'Book'
      puts 'Название книги:'
      title = STDIN.gets.encode("UTF-8").chomp
      puts 'Жанр:'
      genere = 'genere'
      puts 'Автор:'
      author = 'author'

      product = Book.new(price, amount)
      product.update(title, genere, author)
    when 'Music'

      puts 'Название альбома:'
      title = 'title'
      puts 'Исполнитель:'
      artist_name = 'artist_name'
      puts 'Жанр:'
      genere = 'genere'

      product = Music.new(price, amount)
      product.update(title, artist_name, genere)
    when 'Film'
      puts 'Название фильма:'
      title = 'title'
      puts 'Год:'
      year = 'year'
      puts 'Режиссёр:'
      director = 'director'

      product = Film.new(price, amount)
      product.update(title, year, director)
    end
    product
  end
end
