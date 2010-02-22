class BlogGroup < ActiveRecord::Base
  has_many :upload_files
  has_many :blogs, :dependent => :destroy
  has_one :english
  has_one :chinese
  #named_scope :lala, :conditions => { :type => nil }
end
