class OnlinetexteSpalteSerie < ActiveRecord::Migration
  def self.up
    add_column "onlinetexte", "serie", :text
  end

  def self.down
    remove_column "onlinetexte", "serie"
  end
end
