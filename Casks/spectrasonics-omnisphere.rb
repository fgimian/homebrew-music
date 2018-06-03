base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'spectrasonics-omnisphere' do
  version '2.4.2c'
  sha256 '14bf2643e61a1890547ae721221fc5458bff3da9161f7a213c5d926380a40404'

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
