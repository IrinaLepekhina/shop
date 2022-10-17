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
require current_path + '/lib/product_collection.rb'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data').to_a.flatten

puts collection.sort_by{ |h| [h.price, h.amount] }