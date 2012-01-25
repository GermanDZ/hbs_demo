#!/usr/bin/env ruby
# Script to watch a directory for any changes to a haml file
# and compile it.
#
# USAGE: ruby haml_watch.rb <directory_to_watch>
#
# Blake Smith / http://blakesmith.github.com/2010/09/05/haml-directory-watcher.html
#

require 'rubygems'
require 'fssm'

from_path  = ARGV[0] || "."
to_path    = ARGV[1] || "slides"

dir = File.join(File.dirname(__FILE__), from_path)

FSSM.monitor(dir, '**/*.haml') do
  update do |base, relative|
    input   = File.join(base, relative)
    output  = File.join(File.dirname(base), to_path, relative.gsub!('.haml', '.html'))
    command = "haml #{input} #{output} -f html5 -t ugly -q"
    %x{#{command}}
    puts <<-eos
HTML gerado #{Time.now.strftime("%Y/%m/%d %H:%M")}:
  - from: #{input}
  - to: #{output}

    eos
  end
end