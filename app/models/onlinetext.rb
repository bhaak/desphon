class Onlinetext < ActiveRecord::Base
	has_and_belongs_to_many :autoren
	has_many :onlinetextelinks

  def to_param
    return "#{id}-#{titel.normalisiert.gsub(/[^a-z0-9]+/i, '-')}"
  end

end
