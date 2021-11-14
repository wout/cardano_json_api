class Api::LatestBlockTransactions::Index < ApiAction
  get "/api/blocks/latest/txs" do
    transactions = Cardano::TransactionQuery.new
      .preload_block
      .block_id(latest_block.id)
      .block_index.asc_order

    json_api({
      data: Cardano::TransactionSerializer.for_collection(
        transactions,
        expand: true
      ),
      included: [
        Cardano::BlockSerializer.new(latest_block, expand: true),
      ],
    })
  end

  memoize def latest_block : Cardano::Block
    Cardano::BlockQuery.new
      .preload_previous
      .block_no.is_not_nil
      .block_no.desc_order
      .first
  end
end
