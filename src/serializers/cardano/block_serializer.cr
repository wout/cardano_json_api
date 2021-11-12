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
        epoch_no:      @block.epoch_no,
        slot_no:       @block.slot_no,
        epoch_slot_no: @block.epoch_slot_no,
        block_no:      @block.block_no,
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
