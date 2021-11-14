class Cardano::BlockSerializer < RecordSerializer
  def initialize(
    @block : Block,
    @expand : Bool = false
  )
  end

  private def render_base : NamedTuple
    {
      type: "blocks",
      id:   @block.id,
    }
  end

  private def render_expanded : NamedTuple
    {
      attributes: {
        epoch:      @block.epoch_no,
        epoch_slot: @block.epoch_slot_no,
        hash:       @block.hash.hexstring,
        height:     @block.block_no,
        size:       @block.size,
        slot:       @block.slot_no,
        time:       @block.time.to_unix,
        tx_count:   @block.tx_count,
      },
      relationships: {
        previous: previous_block,
      },
      links: {
        self: Api::Blocks::Show.with(@block).url,
      },
    }
  end

  private def previous_block
    if previous = @block.previous
      Cardano::BlockSerializer.new(previous)
    end
  end
end
