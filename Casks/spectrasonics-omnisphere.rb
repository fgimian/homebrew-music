require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'spectrasonics-omnisphere' do
  version '2.3.1'
  sha256 '696789017f2827c62b4600d255825fa33834d8e7cb56dadfc41910a152a7fe6f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Spectrasonics/Omnisphere_Software_Update_Mac_#{version.gsub('.', '_')}.zip")
  name 'Spectrasonics Omnisphere'
  homepage 'https://www.spectrasonics.net/products/omnisphere/'

  pkg "Omnisphere_Software_Update_Mac_#{version.gsub('.', '_')}/Omnisphere Software Update.pkg"

  uninstall pkgutil: 'net.spectrasonics.Omnisphere'

  zap delete: [
                '~/Library/Application Support/Spectrasonics',
                '~/Library/Preferences/net.spectrasonics.V6.plist'
              ]
end
