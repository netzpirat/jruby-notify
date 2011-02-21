module JRubyNotify
  class Listener
    include Java::NetContentobjectsJnotify::JNotifyListener

    def initialize(callback)
      @callback = callback
    end

    def file_renamed(watch, path, file, old)
      @callback.call(path, file, old)
    end

    def file_modified(watch, path, file)
      @callback.call(path, file)
    end

    def file_deleted(watch, path, file)
      @callback.call(path, file)
    end

    def file_created(watch, path, file)
      @callback.call(path, file)
    end

  end
end