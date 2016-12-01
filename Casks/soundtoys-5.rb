require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'soundtoys-5' do
  version '5.1.1.12185'
  sha256 'a4fe57ab97087230cae38fde926eb5ed6c880865ec42431bdc526547af7e03fe'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Soundtoys',
      "Soundtoys 5 v#{version}",
      "Soundtoys5_#{version}.dmg"
    )
  )
  name 'Soundtoys 5'
  homepage 'http://www.soundtoys.com/product/soundtoys-5/'

  pkg 'Install Soundtoys 5.pkg'

  uninstall pkgutil: 'com.soundtoys.com.soundtoys.Soundtoys5.*'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.*'
              ]
end
