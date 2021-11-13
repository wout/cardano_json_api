class Api::Blocks::Index < ApiAction
  include Api::Pagination

  get "/api/blocks" do
    blocks = Cardano::BlockQuery.new
      .preload_previous
      .block_no.is_not_nil
      .block_no.desc_order
      .offset(page_offset)
      .limit(per_page)

    json_api({
      # links: JsonApi::PaginationSerializer(Api::Blocks::Index).new(
      #   page: page,
      #   per_page: per_page,
      #   items_found: blocks.count
      # ),
      data: Cardano::BlockSerializer.for_collection(
        blocks,
        expand: true
      ),
    })
  end
end
