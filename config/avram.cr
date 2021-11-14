abstract class Avram::Where::ValueHoldingSqlClause < Avram::Where::SqlClause
  getter value : String | Array(String) | Array(Int32) | Slice(UInt8)

  def initialize(@column, @value)
  end
end

struct Slice(T)
  def self.adapter
    Lucky
  end

  # def from_json
  #   self.hexbytes
  # end

  # def to_json(json : JSON::Builder) : Nil
  #   json.string(self.hexstring)
  # end

  module Lucky
    alias ColumnType = Bytes
    include Avram::Type

    def self.criteria(query : T, column) forall T
      Criteria(T, Bytes).new(query, column)
    end

    def from_db!(value : Bytes)
      value
    end

    def parse(value : Bytes)
      SuccessfulCast(Bytes).new(value)
    end

    def to_db(value : Bytes)
      value
    end

    class Criteria(T, V) < String::Lucky::Criteria(T, V)
    end
  end
end
