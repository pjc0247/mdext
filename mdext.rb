require 'erb'
require 'pathname'
require 'optionparser'

dst = "doc"

class MdExt
  attr_reader :result

  def initialize path
    @body = File.read(path)
    @result = ""
    parse!
  end

  def parse!
    @body.each_line do |line|
      line.strip!

      line.match /^@\[(?<template>.*)\]\((?<path>.*)\)$/ do |m|
        arg = m[2]
        cwd = $working_dir
        cwf = $path
        puts m
        line = ERB.new(File.read("templates/#{m[1]}.erb"),0,'%<>-').result binding
      end

      @result += line + "\n"
    end
  end
end

$working_dir = dst + "/"
$path = ARGV[0]

path = ARGV[0]

md = MdExt.new path
  
File.write(
  "#{File.dirname(path)}/#{File.basename(path,'.emd')}.md",
  md.result)
=begin
Dir.glob("#{dst}/**/*.emd").each do |path|
  puts path
  md = MdExt.new path
  
  File.write(
    "#{File.dirname(path)}/#{File.basename(path,'.emd')}.md",
    md.result)
end

Watchr::watch("#dst/**/*.emd") do |md|
  puts md
end
=end