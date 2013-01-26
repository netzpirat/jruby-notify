module JRubyNotify
  class Notify

    def initialize
      JRubyNotify.define_library_path
      @watches = []
    end

    def watch(paths, mask = JRubyNotify::FILE_ANY, subtree = true, &callback)
      @paths    = Array(paths)
      @callback = callback
      @mask     = mask
      @subtree  = subtree
    end

    def run
      @watches = @paths.inject([]) do |watches, path|
        watches << Java::NetContentobjectsJNotify::JNotify.addWatch(path, @mask, @subtree, JRubyNotify::Listener.new(@callback))
      end
    end

    def stop
      @watches.each { |watch| Java::NetContentobjectsJNotify::JNotify.removeWatch(watch) }
    end
  end
end