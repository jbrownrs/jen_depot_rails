class StoreController < ApplicationController
  def index
    @products = Product.order(:title)  
    @counter = increment_count
    @display_count = "Welcome! You have visited this page #{@counter} times" if @counter > 5
  end

  protected 

  def increment_count
    # if counter is false or nil set to zero
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
