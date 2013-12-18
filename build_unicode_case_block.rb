#!/usr/bin/env ruby 
#encoding: utf-8


out_file = File.new('case_block.rb', 'w') 
out_file.puts("case c")

(1536...1791).each { |ch| 
	print "#{ch.chr('UTF-8')}?[%.4x]\t" % ch 
	out_file.puts("when #{ch} c=\"#{gets.chomp}\"") 
	} 
out_file.puts("end")
out_file.close
