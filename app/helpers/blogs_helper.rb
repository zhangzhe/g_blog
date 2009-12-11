module BlogsHelper
  def versions_for_select
    text = ""
    CONFIG["version_types"].each do |version_type|
      text << "<option>#{version_type}</option>"
    end
    text
  end
end
