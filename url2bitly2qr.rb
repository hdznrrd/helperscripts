#!/bin/ruby
#
# parse a "name url" style file through bitly and google charts api to create qr codes
#
# ruby bitly.rb <bitly user> <bitly api key> <source file>
#
# source file is a file containing lines like follows
# name http://project.url/here
#

require 'bitly'
require 'net/http'
require 'cgi'

file = File.new(ARGV[2],"r")

while (line = file.gets) do
    bitly = Bitly::V3::Client.new(ARGV[0],ARGV[1])
    shorturl = bitly.shorten line[/http(.+)/]
    Net::HTTP.start("chart.apis.google.com") do |http|
        resp = http.get('/chart?cht=qr&chs=300x300&chl='+CGI.escape(shorturl.short_url))
        open('qrcode_bitly_'+line[/\S+/]+'.png',"wb") do |file|
            file.write(resp.body)
            puts file.path
        end
    end
end


