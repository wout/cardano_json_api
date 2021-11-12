class Api::Blocks::Show < ApiAction
  get "/api/blocks/:block_id" do
    block = Cardano::BlockQuery.new
      .preload_previous
      .id(params.get(:block_id))
      .first

    json Cardano::BlockSerializer.new(block, expand: true)
  end
end
