require 'spec_helper'
require 'fileutils'
require 'tmpdir'

describe JRubyNotify do

  before do
    @test_dir = File.join(Dir.tmpdir, 'notify-test')
    FileUtils.mkdir_p File.join(@test_dir, 'test1', 'test3')
    FileUtils.mkdir_p File.join(@test_dir, 'test2')
  end

  after do
    FileUtils.remove_dir @test_dir
  end

  it "should catch a created file" do
    result = []

    notify = JRubyNotify::Notify.new
    notify.watch @test_dir, JRubyNotify::FILE_CREATED do |path, file|
      result << File.join(path, file)
    end

    notify.run

    files = [
      File.join(@test_dir, 'test1', 'test3', 'a'),
      File.join(@test_dir, 'test1', 'b'),
      File.join(@test_dir, 'c')
    ]

    files.each { |file| FileUtils.touch file }

    sleep 2
    notify.stop

    result.should eql files
  end

  it "should catch a renamed file" do
    result = []

    notify = JRubyNotify::Notify.new
    notify.watch @test_dir, JRubyNotify::FILE_RENAMED do |path, file, old|
      result << File.join(path, file) + '->' + File.join(path, old)
    end

    notify.run

    FileUtils.touch File.join(@test_dir, 'test1', 'test3', 'a')

    sleep 2

    FileUtils.mv File.join(@test_dir, 'test1', 'test3', 'a'), File.join(@test_dir, 'test1', 'test3', 'b')

    sleep 2

    FileUtils.mv File.join(@test_dir, 'test1', 'test3', 'b'), File.join(@test_dir, 'test2', 'c')

    sleep 2
    notify.stop

    result.should eql [
      File.join(@test_dir, 'test1', 'test3', 'a') + '->'  + File.join(@test_dir, 'test1', 'test3', 'b'),
      File.join(@test_dir, 'test1', 'test3', 'b') + '->'  + File.join(@test_dir, 'test2', 'c'),
    ]
  end

  it "should catch a modified file" do
    result = []

    notify = JRubyNotify::Notify.new
    notify.watch @test_dir, JRubyNotify::FILE_MODIFIED do |path, file|
      result << File.join(path, file)
    end

    notify.run

    files = [
      File.join(@test_dir, 'test1', 'test3', 'a'),
      File.join(@test_dir, 'test1', 'b'),
      File.join(@test_dir, 'c')
    ]

    files.each { |file| FileUtils.touch file }

    sleep 2

    FileUtils.touch File.join(@test_dir, 'test1', 'b')

    sleep 2
    notify.stop

    result.should eql [File.join(@test_dir, 'test1', 'b')]
  end

  it "should catch a deleted file" do
    result = []

    notify = JRubyNotify::Notify.new
    notify.watch @test_dir, JRubyNotify::FILE_DELETED do |path, file|
      result << File.join(path, file)
    end

    notify.run

    files = [
      File.join(@test_dir, 'test1', 'test3', 'a'),
      File.join(@test_dir, 'test1', 'b'),
      File.join(@test_dir, 'c')
    ]

    files.each { |file| FileUtils.touch file }

    sleep 2

    FileUtils.rm File.join(@test_dir, 'test1', 'b')

    sleep 2

    FileUtils.rm File.join(@test_dir, 'c')

    sleep 2
    notify.stop

    result.should eql [File.join(@test_dir, 'test1', 'b'), File.join(@test_dir, 'c')]
  end

end
