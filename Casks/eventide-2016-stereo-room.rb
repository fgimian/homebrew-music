require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'eventide-2016-stereo-room' do
  version '2.2.5'
  sha256 '7054268579948a0befb44ca4c4deb198a3001968694f2d6517b54944e24fad83'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Eventide/2016-Stereo-Room-#{version}-osx-installer.dmg")
  name 'Eventide 2016 Stereo Room'
  homepage 'https://www.eventideaudio.com/products/plugins/reverb/2016-stereo-room'

  installer script: "2016-Stereo-Room-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
            args:   %w[--mode unattended],
            sudo:   true

  zap delete: [
                '~/Library/Saved Application State/com.eventide.2016StereoRoom.savedState',
              ]
end
