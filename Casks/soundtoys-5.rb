cask 'soundtoys-5' do
  version '5.1.1.12185'
  sha256 'a4fe57ab97087230cae38fde926eb5ed6c880865ec42431bdc526547af7e03fe'

  url "https://s3.amazonaws.com/soundtoys5/12185/Soundtoys5_#{version}.dmg"
  name 'Soundtoys 5'
  homepage 'http://www.soundtoys.com/product/soundtoys-5/'

  pkg 'Install Soundtoys 5.pkg'

  uninstall pkgutil: 'com.soundtoys.com.soundtoys.Soundtoys5.*'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist'
              ]
end
