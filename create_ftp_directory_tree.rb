# hadez@shackspace.de
# released under OH SHIT TAKE IT AWAY FROM ME license #gpn12

require 'net/ftp'

def dirs(ls)
	ls.each {|e| if /^d.........\s+\d+\s+\S+\s+\S+\s+\d+\s+\S+\s+\d+\s+\d+:\d+\s+(?!\.)(.+)$/ =~ e then yield $1 end }
end

def files(ls)
	ls.each {|e| if /^[^d].........\s+\d+\s+\S+\s+\S+\s+\d+\s+\S+\s+\d+\s+\d+:\d+\s+(.+)$/ =~ e then yield $1 end }
end

def recurse(ftp,dir)
	puts "#{dir}/"
	ls = ftp.dir
	files(ls) { |f| puts "#{dir}/#{f}" }
	dirs(ls) do |d|
		ftp.chdir d
		recurse ftp, "#{dir}/#{d}"
		ftp.chdir '..'
	end	
end


ftp = Net::FTP.new
ftp.connect '94.45.226.43', 21
ftp.login 'anonymous', 'anonymous@example.com'
recurse ftp, ''
ftp.close
