class CreateAutoren < ActiveRecord::Migration
  def self.up
    create_table :autoren do |t|
    end
  end

  def self.down
    drop_table :autoren
  end
end
