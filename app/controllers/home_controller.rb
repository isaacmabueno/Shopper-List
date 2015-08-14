class HomeController < ApplicationController

  #before user can access a resource....
  #we filter out those other

  before_filter :authorize
  def index

    # list all of the products!
    @products = Product.all

  end

  def new

    # create a form that displays product info
    # to create
    @product = Product.new

  end

  def create

    puts '-----PARAMS-----'
    puts params
    puts '----------'
    @product = Product.create(product_params)

  end

  def delete
    @product = Product.find(params[:product][:id]).destroy
  end
private
#private functins that only home controller can use
def product_params
  params.require(:product).permit(:name, :quantity)
end
end
