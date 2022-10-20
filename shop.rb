if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = File.dirname(__FILE__)

require 'csv'
require current_path + '/lib/product.rb'
require current_path + '/lib/book.rb'
require current_path + '/lib/film.rb'
require current_path + '/lib/music.rb'
require current_path + '/lib/product_collection.rb'
require current_path + '/lib/table_reader.rb'

total_price = 0

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data').to_a.flatten

choice = nil

while choice != "x" do
  Product.showcase(collection)
  choice = STDIN.gets.encode("UTF-8").chomp

  if choice != "x" && choice.to_i < collection.size && choice.to_i >= 0
    product = collection[choice.to_i]
    total_price += product.buy
  end
end

puts "стоимость вашей покупки #{total_price}"