require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-zebra' do
  version '2.8.0,7422'
  sha256 'e0ea90d0e63b0dbfa96096346bcbdfcbb0052e6947e57764cbaed6a45c19b99e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/u-he/Zebra2_#{version.major_minor.no_dots}_#{version.after_comma}_Mac.zip")
  name 'u-he Zebra'
  homepage 'https://u-he.com/products/zebra2/'

  pkg "Zebra2_#{version.after_comma}_Mac/Zebra2 #{version.before_comma} Installer.pkg"

  uninstall pkgutil: 'com.u-he.Zebra2.*'

  zap delete: [
                '~/Library/Application Support/u-he/Zebra2',
                '~/Library/Application Support/u-he/Zebralette',
                '~/Library/Application Support/u-he/com.u-he.Zebra2.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Zebra2.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Zebra2.plist',
                '/Library/Application Support/u-he/com.u-he.Zebra2.publicparams.txt',
                '/Library/Application Support/u-he/Zebra2',
                '/Library/Application Support/u-he/Zebralette',
                '/Library/Application Support/u-he/Zebrify',
                '/Library/Application Support/u-he/ZRev',
                '/Library/Application Support/u-he/Themes/Unempty Dark Horse',
              ]
end
