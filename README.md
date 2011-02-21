# JNotify for JRuby

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

## Forecast

With the upcoming release of Java 7 there will be a more robust solution to this problem with the
[WatchService API](http://java.sun.com/developer/technicalArticles/javase/nio/#6). This gem will
make use of this API when it'll be released.

## Other solutions

There are other gems that provides almost the same functionality for MRI:

* [rb-fsevent](https://github.com/thibaudgg/rb-fsevent) for Mac OS X only
* [rb-inotify](https://github.com/nex3/rb-inotify) for Linux only

## Acknowledgement

Omry Yadan for writting the JNotify library and Matthew Donoughe for providing the Mac OS X support.

## License

(The MIT License)

Copyright (c) 2011 Michael Kessler

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.