module JRubyNotify
  class Listener
    include Java::NetContentobjectsJnotify::JNotifyListener

    def initialize(callback)
      @callback = callback
    end

    def file_renamed(watch, path, file, old)
      clean_call(path, file, old)
    end

    def file_modified(watch, path, file)
      clean_call(path, file)
    end

    def file_deleted(watch, path, file)
      clean_call(path, file)
    end

    def file_created(watch, path, file)
      clean_call(path, file)
    end

    private

    def clean_call(*paths)
      @callback.call paths.map { |p| p.tr(File::ALT_SEPARATOR, File::SEPARATOR) }
    end

  end
end