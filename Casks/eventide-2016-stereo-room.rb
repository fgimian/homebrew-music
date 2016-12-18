cask 'eventide-2016-stereo-room' do
  version '2.2.4'
  sha256 '55fb5ec534f2c934a5870379846d7d23bc86f89b558133953c840dc7cf018881'

  url 'https://www.eventideaudio.com/downloader/1165'
  name 'Eventide 2016 Stereo Room'
  homepage 'https://www.eventideaudio.com/products/plugins/reverb/2016-stereo-room'

  installer script: "2016-Stereo-Room-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
            args:   %w[--mode unattended],
            sudo:   true

  zap delete: [
                '~/Library/Saved Application State/com.eventide.2016StereoRoom.savedState',
              ]
end
