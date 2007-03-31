class CreateShortstories < ActiveRecord::Migration
  def self.up
    create_table :shortstories do |t|
    end
  end

  def self.down
    drop_table :shortstories
  end
end
