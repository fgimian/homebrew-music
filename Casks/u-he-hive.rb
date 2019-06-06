require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-hive' do
  version '2.0.0,8676'
  sha256 'aac1d78e8c9b1a022f26458629cc7137efef74d5da7bac98151afaf9d95c5cb7'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/u-he/Hive_#{version.before_comma.major_minor.no_dots}_#{version.after_comma}_Mac.zip")
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
