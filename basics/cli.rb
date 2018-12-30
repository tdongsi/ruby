#!/usr/bin/ruby

require 'erb'

class Basicerb
  attr_reader :newsinapodbranch, :podname, :dockerbranch, :javabackendbranch, :newspublisherbranch, :imageprocessingbranch, :contentservicebranch

  def initialize newsinapodbranch, podname, dockerbranch, javabackendbranch, newspublisherbranch, imageprocessingbranch, contentservicebranch
    @newsinapodbranch = newsinapodbranch
    @podname = podname
    @dockerbranch = dockerbranch
    @javabackendbranch = javabackendbranch
    @newspublisherbranch = newspublisherbranch
    @imageprocessingbranch = imageprocessingbranch
    @contentservicebranch = contentservicebranch
    @template = File.read(File.join(Dir.getwd, "template.erb"))
  end

  def render
    new_file = File.open("pod-#{podname}.yaml", "w+")
    new_file << ERB.new(@template).result( binding )
    new_file.close
  end
end

require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  opts.on("-v", "--version NAME", "branch of the news-in-a-pod") do |v|
    options[:newsiap]=v
  end
  opts.on("-p", "--pod NAME", "name of the pod") do |p|
    options[:pod]=p
  end
  opts.on("-d", "--docker NAME", "tag of the docker") do |d|
    options[:docker]=d
  end
  opts.on("-j", "--javabackendbranch BRANCH", "branch of java-backend") do |j|
    options[:javabackend]=j
  end
  opts.on("-n", "--newspublisherbranch BRANCH", "branch of newspublisher") do |n|
    options[:newspublisher]=n
  end
  opts.on("-i", "--imageprocessingbranch BRANCH", "branch of image-processing") do |i|
    options[:imageprocessing]=i
  end
  opts.on("-c", "--contentservicebranch BRANCH", "branch of content-service") do |c|
    options[:contentservice]=c
  end
  opts.on("-h", "--help", "Prints this help") do
    exit
  end
end.parse!
# raise OptionParser::MissingArgument if options[:path].nil?
newsinapodbranch = if options[:newsiap].nil? then 'master' else options[:newsiap] end
podname = if options[:pod].nil? then 'nip' else options[:pod] end
dockerbranch = if options[:docker].nil? then 'develop' else options[:docker] end
javabackendbranch = if options[:javabackend].nil? then 'develop' else options[:javabackend] end
newspublisherbranch = if options[:newspublisher].nil? then 'develop' else options[:newspublisher] end
imageprocessingbranch = if options[:imageprocessing].nil? then 'develop' else options[:imageprocessing] end
contentservicebranch = if options[:contentservice].nil? then 'develop' else options[:contentservice] end

puts "Generating pod-#{podname}.yaml with news-in-a-pod branch name = #{newsinapodbranch}"
puts "Generating pod-#{podname}.yaml with pod name = #{podname}"
puts "Generating pod-#{podname}.yaml with docker tag name = #{dockerbranch}"
puts "Generating pod-#{podname}.yaml with java-backend branch = #{javabackendbranch}"
puts "Generating pod-#{podname}.yaml with newspublisher branch = #{newspublisherbranch}"
puts "Generating pod-#{podname}.yaml with image-processing branch = #{imageprocessingbranch}"
puts "Generating pod-#{podname}.yaml with content-service branch = #{contentservicebranch}"

b = Basicerb.new(newsinapodbranch, podname, dockerbranch, javabackendbranch, newspublisherbranch, imageprocessingbranch, contentservicebranch)
b.render