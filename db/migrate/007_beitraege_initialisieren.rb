
class BeitraegeInitialisieren < ActiveRecord::Migration

  # Schema for Comatose version 0.7+
  def self.up
    puts "Initialisiere Beitraege ..."
    #Comatose::Page.create( :title=>'Home Page', :body=>"h1. Welcome\n\nYour content goes here...", :author=>'System' )
		root = Comatose::Page.create(:title=>'root', :body=>'', :author=>'System')
		Comatose::Page.create(:title=>'faq', :slug=>'faq', :parent_id=>root.id, :full_path=>'root/faq')
		Comatose::Page.create(:title=>'news', :slug=>'news', :parent_id=>root.id, :full_path=>'root/news')
  end

  def self.down
		execute "delete from comatose_pages where title in ('root', 'faq', 'news')"
		execute "delete from page_versions where title in ('root', 'faq', 'news')"
  end

end
