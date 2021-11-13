module Api::Pagination
  macro included
    param page : Int32 = 1
    param per_page : Int32 = 100
  end

  def page_offset
    (page - 1) * per_page
  end
end
