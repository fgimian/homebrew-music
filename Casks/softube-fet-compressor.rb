require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-fet-compressor' do
  version '2.4.74-20181029-28021-bm599r,281289'
  sha256 '9a3aa0a63b83ccd2e3026a74036104a40c4c8eaaa5a6b346d8761c3efec5a27c'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/FET_Compressor-#{version.before_comma}.zip")
  name 'Softube FET Compressor'
  homepage 'https://www.softube.com/index.php?id=fc'

  pkg "Softube FET Compressor Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_FET_Compressor.*'

  zap delete: [
                '/Library/Application Support/Softube/FET Compressor.txt',
                "/Library/Application Support/Softube/Softube FET Compressor Uninstaller #{version}.pkg",
                '/Library/Application Support/Softube/SSX/FET Compressor.ssx',
              ]
end
