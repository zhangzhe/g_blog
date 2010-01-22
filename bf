#!/usr/bin/env ruby

def exe_cmd(cmd)
  puts cmd
  system cmd
end

cmd = "heroku db:pull zhangzhe_bf"
exe_cmd cmd


cmd = "heroku db:pull"
exe_cmd cmd
