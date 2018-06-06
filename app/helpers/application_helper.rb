module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def convert_price(price)
    if I18n.locale.to_s == "es"
      price = price*1.14
    end
    return number_to_currency(price, :raise => true)
  end
end


