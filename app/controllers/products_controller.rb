class ProductsController < ApplicationController

  def index
    # use MODEL <= Controller uses Model to fetch or create data
    @products = Product.all.order(created_at: :desc)

    # use VIEW  <= Controller uses view to figure out what html or json or ... to send back
    # render :index    <= it does it behind the scene
  end

  def show     # show is an action
    @product = Product.find params[:id]
    puts "here is show action(method)"

    # render :show    <= it does it behind the scene
    # even if yu don't render sth at the end of action it will basically render the name of action as a template

    # @msg  = "Helloooo" then if I add <%= @msg %> in show erb will can see it in browser
  end

end
