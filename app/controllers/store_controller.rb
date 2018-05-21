class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
  end

  def increment_count
    @counter = session[:counter]
    # if counter is false or nil set to zero
    @counter ||= 0
    @counter += 1
  end
end
