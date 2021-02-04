class Admin::DashboardController < ApplicationController

  # Add a before_filter to any controller that you want to secure.
  before_filter :authorize

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'].to_s, password: ENV['ADMIN_PASSWORD'].to_s, except: :index


  def show

    # Display a count of how many products are in the database
    @products_count = Product.count(:all)
    # Display a count of how many categories are in the database
    @categories_count = Category.count(:all)

  end
end
