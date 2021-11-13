class Cardano::Block < Cardano::BaseModel
  table :block do
    primary_key id : Int64
    column epoch_no : Int32?
    column slot_no : Int32?
    column epoch_slot_no : Int32?
    column block_no : Int32?
    column size : Int32
    column time : Time
    column tx_count : Int64

    belongs_to previous : Cardano::Block?
  end
end
