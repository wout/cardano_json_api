abstract class Cardano::BaseModel < Avram::Model
  skip_default_columns

  def self.database : Avram::Database.class
    CardanoDatabase
  end
end
