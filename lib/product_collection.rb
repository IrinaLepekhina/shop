class ProductCollection
include Enumerable
attr_accessor :products

PRODUCT_TYPES = {
  book: {dir: "books", class: Book},
  film: {dir: "films", class: Film},
  music: {dir: "music", class: Music}
}

def initialize(products=[])
  @products = products
end

def self.from_dir(file_path)
  products = []
  products << TableReader.from_xml(file_path + "/" + "products.xml")


  ###\\\ from 3 csv files ///###

  # PRODUCT_TYPES.each do |type, hash|
  #   product_dir = hash[:dir]
  #   product_class = hash[:class] 
    
  #   Dir[file_path + "/" + product_dir +"/*.csv"].each do |path|
  #     products << TableReader.from_csv(path, product_class)
  #   end
  # end

  self.new(products)
end

def to_a
  @products
end

end

