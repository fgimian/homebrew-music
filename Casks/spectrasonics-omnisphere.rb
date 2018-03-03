require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'spectrasonics-omnisphere' do
  version '2.4.0f'
  sha256 '071ac54abe340b664e6fd70be90cb5bbc2e26f55e32fb2bbba2b5f16595e65ba'

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
