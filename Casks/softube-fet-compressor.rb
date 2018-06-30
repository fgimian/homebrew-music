require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-fet-compressor' do
  version '2.4.63-20180620-19846-1wf0gxm,279860'
  sha256 'af3d8aa7b0197e62c2b8ce4729639c6446e91edca39e62fda7fb630fb2c9e2e0'

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
