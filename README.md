# JNotify for JRuby [![Build Status](https://travis-ci.org/netzpirat/jruby-notify.png)](https://travis-ci.org/netzpirat/jruby-notify)

jruby-notify is a thin wrapper around the [JNotify](http://jnotify.sourceforge.net/) library, a java library that allow
java application to listen to file system events, such as:

* File created
* File modified
* File renamed
* File deleted

## Supported platforms

The gem is written for JRuby and uses the JNotify library that supports the following platforms:

* Windows (2000 or newer)
* Linux with INofity support (2.6.14 or newer)
* Mac OS X (10.5 or newer)

Please have a look at the platform specific notes on the [JNotify](http://jnotify.sourceforge.net/) page.

## Installation

    gem install jruby-notify

## Example

    require 'jruby-notify'

    notify = JRubyNotify::Notify.new
    notify.watch Dir.pwd do |path, file|
      puts "Detected change in: #{ File.join(path, file) }"
    end

    notify.run

## Other solutions

There are other gems that provides almost the same functionality for MRI:

* [rb-fsevent](https://github.com/thibaudgg/rb-fsevent) for Mac OS X
* [rb-inotify](https://github.com/nex3/rb-inotify) for Linux
* [rb-fchange](https://github.com/stereobooster/rb-fchange) for Windows
* [wdm](https://github.com/Maher4Ever/wdm) for Windows

## Author

Developed by Michael Kessler, [mksoft.ch](https://mksoft.ch).

If you like JRuby Notify, you can watch the repository at [GitHub](https://github.com/netzpirat/jruby-notify) and
follow [@netzpirat](https://twitter.com/#!/netzpirat) on Twitter for project updates.

## Development

* Issues and feature request hosted at [GitHub Issues](https://github.com/netzpirat/jruby-notify/issues).
* Documentation hosted at [RubyDoc](http://rubydoc.info/github/netzpirat/jruby-notify/master/frames).
* Source hosted at [GitHub](https://github.com/netzpirat/jruby-notify).

Pull requests are very welcome! Please try to follow these simple rules if applicable:

* Please create a topic branch for every separate change you make.
* Make sure your patches are well tested. All specs must pass.
* Update the [Yard](http://yardoc.org/) documentation.
* Update the README.
* Update the CHANGELOG for noteworthy changes.
* Please **do not change** the version number.

## Contributors

See the [CHANGELOG](https://github.com/netzpirat/jruby-notify/blob/master/CHANGELOG.md) and the GitHub list of
[contributors](https://github.com/netzpirat/jruby-notify/contributors).

## Acknowledgement

Omry Yadan for writting the JNotify library and Matthew Donoughe for providing the Mac OS X support.

## License

This Ruby gem is released under the [MIT](https://github.com/netzpirat/jruby-notify/blob/master/LICENSE) license.
The JNotify library is released under the [LPGL](https://github.com/netzpirat/jruby-notify/blob/master/lib/jnotify/LPGL) license.
