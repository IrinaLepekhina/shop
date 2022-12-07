# frozen_string_literal: true

class TableReader
  CSV::Converters[:blank_to_nil] = lambda do |field|
    field && field.empty? ? nil : field
  end

  def self.from_csv(file_path, product_class)
    abort "Файл #{file_path} не найден" unless File.exist?(file_path)

    result = []
    product = nil

    lines = CSV.read(file_path, headers: true, header_converters: :symbol, converters: %i[all blank_to_nil]).map do |a|
      Hash[a]
    end

    lines.each do |line|
      price = line[:price].to_i
      amount = line[:amount].to_i

      case product_class.to_s
      when 'Book'
        product = Book.new(price, amount)
        product.update(
          title = line[:title],
          genere = line[:genere],
          author = line[:author]
        )
      when 'Music'
        product = Music.new(price, amount)
        product.update(
          title = line[:title],
          artist_name = line[:artist_name],
          genere = line[:genere]
        )
      when 'Film'
        product = Film.new(price, amount)
        product.update(
          title = line[:title],
          year = line[:year],
          director = line[:director]
        )
      end
      result.push(product)
    end
    result
  end

  def self.from_xml(file_path)
    abort "Файл #{file_path} не найден" unless File.exist?(file_path)

    file = File.new(file_path, 'r:UTF-8')
    doc = REXML::Document.new(file)
    file.close

    result = []
    product = nil

    doc.each_element('products/product') do |product_node|
      price = product_node.attributes['price'].to_i
      amount = product_node.attributes['amount'].to_i

      product_node.each_element('book') do |book_node|
        product = Book.new(price, amount)
        product.update(
          title = book_node.attributes['title'],
          author = book_node.attributes['author'],
          genere = book_node.attributes['genere']
        )
      end

      product_node.each_element('film') do |film_node|
        product = Film.new(price, amount)
        product.update(
          title = film_node.attributes['title'],
          director = film_node.attributes['director'],
          year = film_node.attributes['year']
        )
      end

      product_node.each_element('music') do |music_node|
        product = Music.new(price, amount)
        product.update(
          title = music_node.attributes['title'],
          artist_name = music_node.attributes['artist_name'],
          genere = music_node.attributes['genere']
        )
      end

      result.push(product)
    end
    result
  end
end
