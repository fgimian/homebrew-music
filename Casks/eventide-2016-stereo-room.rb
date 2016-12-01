require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'eventide-2016-stereo-room' do
  version '2.2.3'
  sha256 '9d3773766484f723cd5557d453a34c5441e3f03d3a3ee6fdfe376e9d59e1525b'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Eventide',
      "Eventide 2016 Stereo Room v#{version}",
      "2016-Stereo-Room-#{version}-osx-installer.dmg"
    )
  )
  name 'Eventide 2016 Stereo Room'
  homepage 'https://www.eventideaudio.com/products/plugins/reverb/2016-stereo-room'

  installer script: "2016-Stereo-Room-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
            args:   %w[--mode unattended],
            sudo:   true

  zap delete: [
                '~/Library/Saved Application State/com.eventide.2016StereoRoom.savedState'
              ]
end
