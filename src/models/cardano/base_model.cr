abstract class Cardano::BaseModel < Avram::Model
  def self.database : Avram::Database.class
    CardanoDatabase
  end
end
