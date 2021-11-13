class Api::Blocks::Index < ApiAction
  param page : Int32?
  param per_page : Int32 = 100

  get "/api/blocks" do
    blocks = Cardano::BlockQuery.new
      .preload_previous
      .block_no.is_not_nil
      .block_no.desc_order
      .limit(per_page)

    if current_page = page
      pages, blocks = paginate(blocks, per_page: per_page)

      render_json(blocks, {
        self:  Api::Blocks::Index.url(page: current_page),
        first: Api::Blocks::Index.url,
        last:  Api::Blocks::Index.url(page: pages.total),
        next:  (Api::Blocks::Index.url(page: pages.next_page) if pages.next_page),
        prev:  (Api::Blocks::Index.url(page: pages.previous_page) if pages.previous_page),
      })
    else
      render_json(blocks, {
        self: Api::Blocks::Index.url(page: page),
      })
    end
  end

  private def render_json(blocks, links)
    json({
      links:    links,
      data:     Cardano::BlockSerializer.for_collection(blocks, expand: true),
      included: %[],
    })
  end
end
