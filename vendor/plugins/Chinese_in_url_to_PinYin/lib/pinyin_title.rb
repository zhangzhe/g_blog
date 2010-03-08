module PinyinTitle
    def self.included(base)
      base.extend ClassMethods
    end

  module ClassMethods
    def pinyin_title(pinyin_type = :title)
      include PinyinTitle::InstanceMethods
      class_variable_set(:@@pinyin_type, pinyin_type.to_s)
    end
    
    def get_pinyin_type
      class_variable_get(:@@pinyin_type)
    end
  end
  
  module InstanceMethods
    require "pinyin"
    
    define_method("pinyin_type_of") do |type|
      PinYin.instance.to_permlink(self.send(type))
    end 

    def to_param
      return "#{id}-#{pinyin_type_of(self.class.get_pinyin_type)}"
    end
  end
end
