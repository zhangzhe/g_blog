require 'singleton'
class PinYin
  include Singleton
  def initialize
    require "yaml"
    @codes = YAML.load_file("#{RAILS_ROOT}/public/Mandarin.yml")
  end

  def to_permlink(str)
    str_to_pinyin(str,'_')
  end

  def to_pinyin_abbr(str)
    str_to_pinyin(str,'',false,true)
  end

  def to_pinyin_abbr_else(str)
    str_to_pinyin(str,'',true,nil)
  end

  def to_pinyin(str,separator='',tone=false)
    str_to_pinyin(str,separator,false,false,tone)
  end

  private

  def get_value(code)
    @codes[code]
  end

  def str_to_pinyin(str,separator='',abbr_else=false,abbr=false,tone=false)
    res = []
    str.unpack('U*').each_with_index do |t,idx|
      code = sprintf('%x',t).upcase
      val = get_value(code)
      if val
        unless tone
          val = val.gsub(/\d/,'')
        end
        if (abbr and !abbr_else) or (abbr_else and idx!=0)
          val = val[0..0]
        end
        res << val.downcase+separator
      else
        tmp = [t].pack('U*')
        res << tmp if tmp =~ /^[_0-9a-zA-Z\s]*$/ 
      end
    end
    unless separator==''
      re = Regexp.new("\\#{separator}+")
      re2 = Regexp.new("\\#{separator}$")
      return res.join('').gsub(/\s+/,separator).gsub(re,separator).gsub(re2,'')
    else
      return res.join('')
    end
  end
end
