require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'eventide-2016-stereo-room' do
  version '3.2.1'
  sha256 '88d5114312476639aea21f63c3d3dd10ed664359ff7a005e54a670b5c1c9e089'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Eventide/2016-Stereo-Room-#{version}-osx-installer.dmg")
  name 'Eventide 2016 Stereo Room'
  homepage 'https://www.eventideaudio.com/products/plugins/reverb/2016-stereo-room'

  installer script: "2016-Stereo-Room-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
            args:   ['--mode', 'unattended'],
            sudo:   true

  zap delete: [
                '~/Library/Saved Application State/com.eventide.2016StereoRoom.savedState',
              ]
end
