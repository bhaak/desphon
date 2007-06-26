class Autorenonlinetexte < ActiveRecord::Migration
  def self.up
		  execute "create table Autoren_Onlinetexte (\n"+ 
										" autor_id integer,\n"+ 
										" onlinetext_id integer)"
  end

  def self.down
	  drop_table :autoren_onlinetexte
  end
end
