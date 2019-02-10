require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'eventide-2016-stereo-room' do
  version '3.3.1'
  sha256 '74109cadb196cebe767a9251d97b61c8f93b05f10bf856810184cbaa2f23272a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Eventide/2016-Stereo-Room-#{version}-osx-installer.dmg")
  name 'Eventide 2016 Stereo Room'
  homepage 'https://www.eventideaudio.com/products/plugins/reverb/2016-stereo-room'

  installer script: "2016-Stereo-Room-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
            args:   ['--mode', 'unattended'],
            sudo:   true

  uninstall delete: [
                      '/Library/Application Support/Avid/Audio/Plug-Ins/Eventide/2016 Stereo Room.aaxplugin',
                      '/Library/Audio/Plug-Ins/VST/Eventide/2016 Stereo Room.vst',
                      '/Library/Audio/Plug-Ins/Components/2016 Stereo Room.component',
                    ]

  zap delete: [
                '~/Library/Saved Application State/com.eventide.2016StereoRoom.savedState',
              ]
end
