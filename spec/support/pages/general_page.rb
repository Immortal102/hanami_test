class GeneralPage < SitePrism::Page
  set_url '/'
  set_url_matcher(/\A?\Z/)

  private

  def all_visible?(*item_list)
    item_list.all? { |item| send(item).visible? }
  end

  def exists_on_page?(*items)
    items.all? { |item| send("has_#{item}?") }
  end
end
