require 'java'
require 'jnotify/jnotify-0.94.jar'

module JRubyNotify

  VERSION = '0.4.0'

  FILE_CREATED  = 1
  FILE_DELETED  = 2
  FILE_MODIFIED = 4
  FILE_RENAMED  = 8

  FILE_ANY = FILE_CREATED | FILE_DELETED | FILE_MODIFIED | FILE_RENAMED

  autoload :Notify, 'jruby-notify/notify'
  autoload :Listener, 'jruby-notify/listener'

  #
  # Tests if the native library can be loaded
  #
  def self.supported?
    define_library_path
    begin
      Java::NetContentobjectsJNotify::JNotify
      true
    rescue NameError
      false
    end
  end

  #
  # Defines the environment to be able to load the native
  # JNotify libraries
  #
  def self.define_library_path
    library_path = java.lang.System.get_property('java.library.path')
    return if library_path =~ /jnotify/i

    jnotify_library_path = File.expand_path(File.join(File.dirname(__FILE__), 'jnotify', 'shared'))
    new_library_path = [jnotify_library_path, library_path].join(java.io.File.pathSeparator)
    java.lang.System.set_property('java.library.path', new_library_path)

    field = java.lang.Class.for_name('java.lang.ClassLoader').get_declared_field('sys_paths')
    if field
      field.accessible = true
      field.set(java.lang.Class.for_name('java.lang.System').get_class_loader, nil)
    end
  end

end