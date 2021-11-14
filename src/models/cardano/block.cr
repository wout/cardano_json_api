class Cardano::Block < Cardano::BaseModel
  table :block do
    primary_key id : Int64
    column block_no : Int32?
    column epoch_no : Int32?
    column epoch_slot_no : Int32?
    column hash : Bytes
    column size : Int32
    column slot_no : Int32?
    column time : Time
    column tx_count : Int64
    column proto_major : Int32
    column proto_minor : Int32
    column vrf_key : String?
    column op_cert : Bytes?
    column op_cert_counter : Int64?

    belongs_to previous : Cardano::Block?
    has_many transactions : Cardano::Transaction
  end
end
