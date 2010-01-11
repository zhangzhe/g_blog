module Tags
  RUBY_FILES = FileList['app/**/*.*']
end
namespace "tags" do
  task :emacs => Tags::RUBY_FILES do
    puts "Making Emacs TAGS file"
    sh "/usr/bin/ctags -e #{Tags::RUBY_FILES}", :verbose => false
  end
end
task :tags => ["tags:emacs"]
