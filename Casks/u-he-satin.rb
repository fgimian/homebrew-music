require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-satin' do
  version '1.3.1,7414'
  sha256 '054a168daf4f4e8a85e2bf7bc374dcfda861d1e677e9b9f054326fe43ce0d3f5'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/u-he/Satin_#{version.before_comma.no_dots}_#{version.after_comma}_Mac.zip")
  name 'u-he Satin'
  homepage 'https://u-he.com/products/satin/'

  pkg "Satin_#{version.after_comma}_Mac/Satin #{version.before_comma} Installer.pkg"

  uninstall pkgutil: 'com.u-he.Satin.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.Satin.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Satin.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Satin.plist',
                '/Library/Application Support/u-he/Satin',
              ]
end
