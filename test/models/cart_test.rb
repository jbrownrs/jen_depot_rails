require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :carts
  
  test "add unique products" do
    cart = Cart.create
    book_one = products(:one)
    book_two  = products(:two)
    cart.add_product(book_one.id).save!
    cart.add_product(book_two.id).save!
    assert_equal 2, cart.line_items.size
    assert_equal products(:one).price + products(:two).price, cart.total_price
  end

  test "add duplicate products" do
    cart = Cart.create
    ruby_book = products(:ruby)
    cart.add_product(ruby_book.id).save!
    cart.add_product(ruby_book.id).save!
    assert_equal 1, cart.line_items.size
    assert_equal 2, cart.line_items[0].quantity
    assert_equal 2*ruby_book.price, cart.total_price
end
  # test "the truth" do
  #   assert true
  # end
end
