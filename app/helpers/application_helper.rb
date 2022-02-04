module ApplicationHelper
  include Pagy::Frontend
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def nested_items(items)    
    items.map do |item, sub_items|
      content_tag(:div,
                  (item.name +  content_tag(
                                            :div,
                                            nested_items(sub_items),
                                            class: 'nested',
                                            'data-id': item.id,
                                            )).html_safe,
                  class: "list-group-item ",
                  'data-id': item.id,
                )
    end.join.html_safe
  end
end
