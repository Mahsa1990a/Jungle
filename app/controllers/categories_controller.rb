class CategoriesController < ApplicationController

  # Add a before_filter to any controller that you want to secure.
  before_filter :authorize

  def show
    @category = Category.find(params[:id])
    # raise @category.inspect
    @products = @category.products.order(created_at: :desc)
  end

end
