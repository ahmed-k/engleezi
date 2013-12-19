#!/usr/bin/env ruby 
#encoding: utf-8
##THIS SCRIPT CONVERTS FILENAMES IN ARABIC TO THEIR EQUIVALENT IN ENGLISH#
require 'fileUtils'
include FileUtils

def convert (arg) 
	newname=""
	matchstring = /.*\p{Arabic}+.*/.match(arg)
	if matchstring.nil?
		puts "No Arabic characters matched for:  " +  arg
	else 	
		matchstring[0].each_char do |ch| 
			newname << englify(ch.ord) 
		end 
			File.rename(arg, newname)
			puts "Converted #{arg} to #{newname}"
	end 
end 

def englify (c) 

case c
when (1536...1791) 
	case c  
	when 1548 then c=","  
	when 1551 then c="3"
	when 1563 then c=";"
	when 1567 then c="?"
	when (1569...1574) , 1634 , (1652...1654) then c="2"
	when 1575 then c="a"
	when 1576 then c="b"
	when 1577 then c="H"
	when 1578 then c="t"
	when 1579 then c="th"
	when 1580 then c="j"
	when 1581 then c="7"
	when 1582 then c="kh"
	when 1583 then c="d"
	when 1584 then c="dh"
	when 1585 then c="r"
	when 1586 then c="z"
	when 1587 then c="s"
	when 1588 then c="sh"
	when 1589 then c="S"
	when 1590 then c="DH"
	when 1591 then c="6"
	when 1592 then c="6H"
	when 1593 then c="3"
	when 1594 then c="GH"
	when 1601 then c="f"
	when 1602 then c="q"
	when 1603 then c="k"
	when 1604 then c="l"
	when 1605 then c="m"
	when 1606 then c="n"
	when 1607 then c="h"
	when 1608 then c="w"
	when 1609 then c="a"
	when 1610 then c="i"
	when 1633 then c="1"
	when 1635 then c="3"
	when 1636 then c="4"
	when 1637 then c="5"
	when 1638 then c="6"
	when 1639 then c="7"
	when 1640 then c="8"
	when 1641 then c="9"
	when 1642 then c="%"
	when 1644 then c=","
	when 1645 then c="*"
	when 1649 then c="a"
	when 1650 then c="a"
	when 1651 then c="a"
	when 1654 then c="2o"
	when 1655 then c="2o"
	when 1656 then c="2"
	when 1657 then c="t"
	when 1658 then c="th"
	when 1659 then c="p"
	when 1660 then c="pt"
	when 1661 then c="t"
	when 1662 then c="P"
	when 1663 then c="t"
	when 1664 then c="p"
	when 1667 then c="g"
	when 1668 then c="g"
	when 1669 then c="kh"
	when 1670 then c="ch"
	when 1671 then c="CH"
	when 1672, 1678, 1680 then c="D"
	when 1673, 1674, 1769 then c="d"
	when (1675..1678),1696 then c="DH"
	when 1681 then c="R"
	when (1682..1688) then c="r"
	when 1688, 1689 then c="J"
	when (1690..1696) then c="S"
	when 1697 then c="gh"
	when 1698 then c="v"
	when 1699 then c="v"
	when 1700 then c="v"
	when 1701 then c="V"
	when 1702 then c="v"
	when 1703 then c="v"
	when 1704 then c="q"
	when 1705 then c="q"
	when 1706 then c="k"
	when 1707 then c="k"
	when 1708 then c="k"
	when 1709 then c="k"
	when 1710 then c="k"
	when 1711 then c="k"
	when 1712 then c="g"
	when 1713 then c="g"
	when 1714 then c="g"
	when 1715 then c="g"
	when 1716 then c="g"
	when 1717 then c="g"
	when 1718 then c="l"
	when 1719 then c="l"
	when 1720 then c="l"
	when 1721 then c="l"
	when 1722 then c="n"
	when 1723 then c="n"
	when 1724 then c="n"
	when 1725 then c="n"
	when 1726 then c="n"
	when 1727 then c="h"
	when 1728 then c="ch"
	when 1729 then c="eh"
	when 1735 then c="w"
	when 1736 then c="o"
	when 1737 then c="o"
	when 1738 then c="o"
	when 1739 then c="o"
	when 1740 then c="e"
	when 1741 then c="e"
	when 1742 then c="e"
	when 1743 then c="o"
	when 1744 then c="e"
	when 1745 then c="e"
	when 1748 then c="."
	when 1776 then c="0"
	when 1777 then c="1"
	when 1778 then c="2"
	when 1779 then c="3"
	when 1780 then c="4"
	when 1781 then c="5"
	when 1782 then c="6"
	when 1783 then c="7"
	when 1784 then c="8"
	when 1785 then c="9"
	when 1786 then c="sh"
	when 1787 then c="dh"
	when 1788 then c="gh"
	else c=""
	end
end
c
end 

def dir_rename(path)
	puts "Entering #{path}"
	Dir.glob(File.expand_path(path)+"/*").each do |f|
		puts f 
		if File.directory?(f) 
			dir_rename(f)
		end 
			convert f
		end
	end
end

if ARGV.length > 1
       	abort "ERROR: invalid number of arguments\n"
end

if ARGV.length == 0
	puts "\nSearching all directories and subdirectories in #{Dir.pwd}" 
	3.times 
	puts "\n"

Dir['**'].each do |r|
	dir_rename(File.expand_path(".") + "/" + r)
end

else 
arg  = ARGV.at(0)

if File.exist?(arg)  
	if File.directory?(arg) 
		puts "#{arg} is a directory" 
		dir_rename(File.expand_path(arg))
	else 
	puts "File #{arg} found"
	convert(arg,File.expand_path(".")) 
	end 
else 
	puts "#{arg} not found"
end 

end 
