class Api::LatestBlock::Show < ApiAction
  get "/api/blocks/latest" do
    block = Cardano::BlockQuery.new
      .preload_previous
      .block_no.is_not_nil
      .block_no.desc_order
      .first

    json_api({
      data: Cardano::BlockSerializer.new(block, expand: true),
    })
  end
end
