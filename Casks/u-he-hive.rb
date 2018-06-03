base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-hive' do
  version '1.1.0,3898'
  sha256 '57e2a2285f391154b40b10b92f428873ce45c941d48940d5adb671276fdbecd3'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/u-he/Hive_#{version.major_minor.dots_to_underscores}_Mac.zip")
  name 'u-he Hive'
  homepage 'https://u-he.com/products/hive/'

  pkg "Hive#{version.after_comma}Mac/Hive #{version.before_comma}.#{version.after_comma} Installer.pkg"

  uninstall pkgutil: 'com.u-he.Hive.*'

  zap delete: [
                '~/Library/Application Support/u-he/Hive',
                '~/Library/Application Support/u-he/com.u-he.Hive.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Hive.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Hive.plist',
                '/Library/Application Support/u-he/Hive',
              ]
end
