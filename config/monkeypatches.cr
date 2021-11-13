class Lucky::Paginator
  # Returns the previous page number or nil if the current page is the first one.
  def previous_page : Int32?
    page - 1 unless first_page?
  end

  # Returns the next page number or nil if the current page is the last one.
  def next_page : Int32?
    page + 1 unless last_page? || overflowed?
  end

  # Returns the path with a 'page' query param for the previous page.
  #
  # Return nil if there is no previous page
  def path_to_previous : String?
    if page_number = previous_page
      path_to_page(page_number)
    end
  end

  # Returns the path with a 'page' query param for the previous page.
  #
  # Return nil if there is no previous page
  def path_to_next : String?
    if page_number = next_page
      path_to_page(page_number)
    end
  end
end
