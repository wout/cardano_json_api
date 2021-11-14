class Api::Transactions::Show < ApiAction
  get "/api/txs/:transaction_id" do
    json_api({
      data:     Cardano::TransactionSerializer.new(transaction, expand: true),
      included: [
        Cardano::BlockSerializer.new(transaction.block, expand: true),
      ],
    })
  end

  memoize def transaction : Cardano::Transaction
    id = params.get(:transaction_id)
    query = Cardano::TransactionQuery.new
      .preload_block(Cardano::BlockQuery.new.preload_previous)

    if id.is_a?(String)
      query = query.hash(id.hexbytes)
    else
      query = query.id(id)
    end

    transaction = query.first
  end
end
