class Blog < ActiveRecord::Base
  has_many :upload_files
  has_many :versions, :dependent => :destroy do
    CONFIG["version_types"].each do |version_type|
      define_method "#{version_type}" do
        find_by_version_type(version_type)
      end
      
      define_method "create_#{version_type}" do
        create(:version_type => version_type)
      end
    end
  end
  
  def title_of_versions
    versions.map(&:title).join(", ")
  end
end
