class Cardano::Transaction < Cardano::BaseModel
  table :tx do
    primary_key id : Int64
    column block_index : Int32
    column deposit : Int64
    column fee : Float64
    column hash : Bytes
    column invalid_before : Float64?
    column invalid_hereafter : Float64?
    column out_sum : Float64
    column script_size : Int32
    column size : Int32
    column valid_contract : Bool

    belongs_to block : Cardano::Block
  end
end
