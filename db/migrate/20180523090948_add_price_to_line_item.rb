class AddPriceToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |line|
      line.price = line.product.price
    end
  end

  def self.down
    remove_column :line_items, :price
  end
end

