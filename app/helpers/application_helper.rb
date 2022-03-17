module ApplicationHelper
  
  def sold_out(product)
    if product.quantity == 0
      content_tag(:aside, content_tag(:h5, content_tag(:strong, "SOLD OUT!")), class: "soldout")
    end
  end
end
