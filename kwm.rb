class Kwm < Formula
  desc "Tiling window manager with focus follows mouse for OSX."
  homepage "https://koekeishiya.github.io/kwm/"
  url "https://github.com/koekeishiya/kwm/releases/download/v1.1.2/Kwm-1.1.2.zip"
  sha256 "dfec93b0d5689ca8ca82398010bcd2fbfd9d9fcb909ee74c6ba71f05d96150ac"

  def install
    bin.install "kwmc"
    prefix.install %w[kwm kwm-overlay kwmrc]
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_prefix}/kwm</string>
      </array>
      <key>KeepAlive</key>
      <true/>
      <key>Sockets</key>
      <dict>
        <key>Listeners</key>
        <dict>
          <key>SockServiceName</key>
          <string>3020</string>
          <key>SockType</key>
          <string>dgram</string>
          <key>SockFamily</key>
          <string>IPv4</string>
      </dict>
    </dict>
    </dict>
    </plist>
    EOS
  end

  def caveats; <<-EOS.undent
    Copy the example config from #{prefix}/kwmrc into your home directory.
      mkdir -p ~/.kwm
      cp #{prefix}/kwmrc ~/.kwm/kwmrc
    EOS
  end

  test do
    system "#{opt_prefix}/kwm", "--version"
  end
end
