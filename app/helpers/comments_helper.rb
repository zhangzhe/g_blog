module CommentsHelper
  def complete(url)
    unless url =~ /http/
      url = "http://#{url}"
    end
    return url
  end
end
