require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'eventide-2016-stereo-room' do
  version '3.1.2'
  sha256 '9a65e19a9ecd7f991281d4e5140f75476a47bed7a661793a863ba99d6c26d838'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Eventide/2016-Stereo-Room-#{version}-osx-installer.dmg")
  name 'Eventide 2016 Stereo Room'
  homepage 'https://www.eventideaudio.com/products/plugins/reverb/2016-stereo-room'

  installer script: "2016-Stereo-Room-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
            args:   ['--mode', 'unattended'],
            sudo:   true

  zap delete: [
                '~/Library/Saved Application State/com.eventide.2016StereoRoom.savedState',
              ]
end
