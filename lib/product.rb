class Product
  
  def initialize(price, amount)
    @price = price
    @amount = amount
  end

  def price
    @price
  end

  def update(*params)
  end

  def info
  end

  def add_product
  end

  def show
    " #{info} - #{@price} руб. (осталось #{@amount})"
  end

  def self.showcase(collection)
    puts "Что хотите купить?\n\n"

    collection.each_with_index do |product, index|
      puts "#{index}: #{product.show}"
    end

    puts "x. Покинуть магазин\n\n"
  end

  def buy
    if @amount > 0
      puts "* * *"
      puts "Вы купили товар #{info}"
      puts "* * *\n\n"

      @amount -= 1
      price
    else
      puts "К сожалению, больше нет"
      0
    end
  end

  def self.product_types
    [Book, Film, Music]
  end

  def save_to_xml(file_path, product)
    unless File.exist?(file_path)
      abort "Файл #{file_path} не найден"
    end
    
    file = File.new(file_path, "r:UTF-8")
    doc = REXML::Document.new(file)
    file.close
    
    product.add_product(doc, product)
    
    file = File.new(file_path, "w:UTF-8")
    doc.write(file, 2)
    file.close
  end

end