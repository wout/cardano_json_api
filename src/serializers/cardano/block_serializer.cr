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
        block:      @block.block_no,
        epoch:      @block.epoch_no,
        epoch_slot: @block.epoch_slot_no,
        slot:       @block.slot_no,
        size:       @block.size,
        time:       @block.time,
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
