class Cardano::Tx < Cardano::BaseModel
  table :tx do
    primary_key id : Int64
    column block_index : Int32

    belongs_to block : Cardano::Block
  end
end
