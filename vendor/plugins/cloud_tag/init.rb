require 'cloud_tag'
ActionView::Base.send(:include, CloudTag::Helpers)
require "fileutils"
dir = "public/flash"
flash_file = Rails.root.join("vendor/plugins/cloud_tag/flash/cloudtag.swf").to_s
FileUtils.mkdir_p dir unless File.exists? dir
FileUtils.cp(flash_file, dir)
