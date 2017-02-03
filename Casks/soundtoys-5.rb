cask 'soundtoys-5' do
  version '5.2.0.12502'
  sha256 'e991f754a07e636f2671538859033e5c60d73079097ed8725c241872a2c2e2bd'

  # s3.amazonaws.com/soundtoys5 was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/soundtoys5/12502/Soundtoys5_#{version}.dmg"
  name 'Soundtoys 5'
  homepage 'http://www.soundtoys.com/product/soundtoys-5/'

  pkg 'Install Soundtoys 5.pkg'

  uninstall pkgutil: 'com.soundtoys.com.soundtoys.Soundtoys5.*'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
