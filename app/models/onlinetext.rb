class Onlinetext < ActiveRecord::Base
	has_and_belongs_to_many :autoren
	has_many :onlinetextelinks

  def to_param
    return "#{id}-#{titel.suchmaschinenfreundlich}"
  end

end
