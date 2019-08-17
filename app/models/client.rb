class Client < ActiveRecord::Base
    has_secure_password
    has_many :reservations
    has_many :comments
    validates_presence_of :first_name, :last_name, :email, :username, :password  
    
  def slug 
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Client.all.find{|client| client.slug == slug}
  end

end
