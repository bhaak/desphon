class NeueOnlinetexteSpalten < ActiveRecord::Migration
	def self.up
		add_column "onlinetexte", "uebersetzer", :text
		add_column "onlinetexte", "kommentar", :text
	end

	def self.down
		remove_column "onlinetexte", "kommentar"
		remove_column "onlinetexte", "uebersetzer"
	end
end
