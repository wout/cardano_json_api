class Cardano::TransactionSerializer < RecordSerializer
  def initialize(
    @transaction : Transaction,
    @expand : Bool = false
  )
  end

  private def render_base : NamedTuple
    {
      type: "txs",
      id:   @transaction.id,
    }
  end

  private def render_expanded : NamedTuple
    {
      attributes: {
        deposit:           @transaction.deposit,
        fee:               @transaction.fee,
        hash:              @transaction.hash.hexstring,
        index:             @transaction.block_index,
        invalid_before:    @transaction.invalid_before,
        invalid_hereafter: @transaction.invalid_hereafter,
        output_sum:        @transaction.out_sum,
        script_size:       @transaction.script_size,
        size:              @transaction.size,
        valid_contract:    @transaction.valid_contract,
      },
      relationships: {
        block: Cardano::BlockSerializer.new(@transaction.block),
      },
      links: {
        self: Api::Transactions::Show.with(@transaction).url,
      },
    }
  end
end
