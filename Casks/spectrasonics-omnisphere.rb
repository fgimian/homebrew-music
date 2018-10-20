require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'spectrasonics-omnisphere' do
  version '2.5.1d'
  sha256 '53764a699a52bf592f20d0779e50c146224469c9c7e037edde68bae831ce499f'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Spectrasonics/Omnisphere_Software_Update_Mac_#{version.dots_to_underscores}.zip")
  name 'Spectrasonics Omnisphere'
  homepage 'https://www.spectrasonics.net/products/omnisphere/'

  pkg "Omnisphere_Software_Update_Mac_#{version.dots_to_underscores}/Omnisphere Software Update.pkg"

  uninstall pkgutil: 'net.spectrasonics.Omnisphere'

  zap delete: [
                '~/Library/Application Support/Spectrasonics',
                '~/Library/Preferences/net.spectrasonics.V6.plist',
              ]
end
