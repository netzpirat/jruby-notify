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

    #
    # Ensure that all paths have File::SEPARATOR as separator
    # This avoid a mix of different separators within the paths
    #
    def clean_call(*paths)
      if File::ALT_SEPARATOR
        @callback.call paths.map { |p| p.tr(File::ALT_SEPARATOR, File::SEPARATOR) }
      else
        @callback.call paths
      end
    end

  end
end