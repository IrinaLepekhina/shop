class TableReader

  CSV::Converters[:blank_to_nil] = lambda do |field|
    field && field.empty? ? nil : field
  end

  def self.from_csv(file_path, product_class)

    unless File.exist?(file_path)
      abort "Файл #{file_path} не найден"
    end

    result = []
    product = nil
    
    lines = CSV.read(file_path, headers: true, header_converters: :symbol, converters: [:all, :blank_to_nil]).map {|a| Hash[a]}
    
    lines.each do |line|
      price = line[:price].to_i
      amount = line[:amount].to_i

      case product_class.to_s
      when "Book"
        product = Book.new(price, amount)
        product.update(
          title = line[:title],
          genere = line[:genere],
          author = line[:author]
        )

      when "Music"
        product = Music.new(price, amount)
        product.update(
          title = line[:title],
          artist_name = line[:artist_name],
          genere = line[:genere]
        )
      when "Film"
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
end