require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-hive' do
  version '1.2.0,8115'
  sha256 '1ba8670614afd3749e1677a2de138b77eee50dfc0c7ccf2f4513411de2ba4810'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/u-he/Hive_#{version.before_comma.no_dots}_#{version.after_comma}_Mac.zip")
  name 'u-he Hive'
  homepage 'https://u-he.com/products/hive/'

  pkg "Hive_#{version.after_comma}_Mac/Hive #{version.before_comma} Installer.pkg"

  uninstall pkgutil: 'com.u-he.Hive.*'

  zap delete: [
                '~/Library/Application Support/u-he/Hive',
                '~/Library/Application Support/u-he/com.u-he.Hive.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Hive.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Hive.plist',
                '/Library/Application Support/u-he/Hive',
              ]
end
