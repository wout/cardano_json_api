class JsonApi::PaginationSerializer(T) < BaseSerializer
  def initialize(
    @page : Int32,
    @per_page : Int32,
    @items_found : Int32
  )
  end

  def render
    {
      :self  => self_link,
      :first => first_link,
      :prev  => prev_link,
      :next  => next_link,
    }.compact
  end

  private def self_link
    url_with_page(@page)
  end

  private def first_link
    url_with_page(1) unless @page == 1
  end

  private def prev_link
    url_with_page(@page.pred) unless @page <= 1
  end

  private def next_link
    url_with_page(@page.succ) unless @items_found < @per_page
  end

  private def url_with_page(page)
    page == 1 ? T.url : T.url(page: page)
  end
end
