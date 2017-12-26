require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'spectrasonics-omnisphere' do
  version '2.3.2h'
  sha256 '650d4228699d6934672bb838adff8e7dfe29c3b532f4a42e01e9a9b7ecf6cd4e'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Spectrasonics/Omnisphere_Software_Update_Mac_#{version.dots_to_underscores}.zip")
  name 'Spectrasonics Omnisphere'
  homepage 'https://www.spectrasonics.net/products/omnisphere/'

  pkg "Omnisphere_Software_Update_Mac_#{version.dots_to_underscores}/Omnisphere Software Update.pkg"

  uninstall pkgutil: 'net.spectrasonics.Omnisphere'

  zap delete: [
                '~/Library/Application Support/Spectrasonics',
                '~/Library/Preferences/net.spectrasonics.V6.plist',
              ]
end
