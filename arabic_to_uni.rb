#!/usr/bin/env ruby 
#encoding: utf-8

puts "CHARACTER\t\tDECIMAL\t\tUNICODE" 
(1536...1791).each { |ch| 
	print "#{ch.chr('UTF-8')}" 
	3.times do   
	print "\t" 
	end 
	print ch
	2.times {  
	print "\t" }
	print "\\u%.4x\n" % ch 
}	

