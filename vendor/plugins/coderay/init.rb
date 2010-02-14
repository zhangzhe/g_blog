require 'coderay_string'
require 'coderay' 
class CodeRayUtil
  def self.copy_css_file
    require "fileutils"
    dir = "public/stylesheets"
    flash_file = Rails.root.join("vendor/plugins/coderay/stylesheets/coderay.css").to_s
    FileUtils.mkdir_p dir unless File.exists? dir
    FileUtils.cp(flash_file, dir)
  rescue
  end
end

CodeRayUtil.copy_css_file
