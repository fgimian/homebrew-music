cask 'eventide-2016-stereo-room' do
  version '2.2.5'
  sha256 '7054268579948a0befb44ca4c4deb198a3001968694f2d6517b54944e24fad83'

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
