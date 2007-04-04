class CreateOnlinetexte < ActiveRecord::Migration
  def self.up
    create_table :onlinetexte do |t|
    end
  end

  def self.down
    drop_table :onlinetexte
  end
end
