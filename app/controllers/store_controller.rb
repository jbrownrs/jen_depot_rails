class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)  
      @counter = increment_count
      @display_count = "Welcome! You have visited this page #{@counter} times" if @counter > 5
    end
  end

  protected 

  def increment_count
    # if counter is false or nil set to zero
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
