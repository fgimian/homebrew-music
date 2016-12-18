cask 'novation-bass-station' do
  version '2.1'
  sha256 '5546b5aa7db75a27d0a3f8da32cdbb2ff0028cd1bfdcf95c9e9cc8124d46b195'

  # d19ulaff0trnck.cloudfront.net was verified as official when first introduced to the cask
  url "https://d19ulaff0trnck.cloudfront.net/sites/default/files/novation/downloads/10062/bassstation-#{version}.dmg"
  name 'Novation Bass Station'
  homepage 'https://us.novationmusic.com/software/bass-station'

  pkg 'Install BassStation.pkg'

  uninstall pkgutil: 'com.novation.bassstation-*'

  zap delete: [
                '~/Library/Preferences/com.novation.vst.BassStationStereo.plist',
                '~/Library/Preferences/com.vsoft.novation.bassstationV1.plist',
              ]
end
