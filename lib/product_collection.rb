class ProductCollection

  attr_accessor :products

PRODUCT_TYPES = {
  book: {dir: "books", class: Book},
  film: {dir: "films", class: Film}
}

def initialize(products=[])
  @products = products
end

def self.from_dir(file_path)
  products = []

  PRODUCT_TYPES.each do |type, hash|
    product_dir = hash[:dir]
    product_class = hash[:class]
    
    Dir[file_path + "/" + product_dir +"/*.txt"].each do |path|
      products << product_class.from_file(path)
    end
  end

  self.new(products)
end

def to_a
  @products
end

end
