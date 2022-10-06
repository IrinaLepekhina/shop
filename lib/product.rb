class Product
  attr_accessor :price, :amount, :name

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @name = params[:name]
  end
end