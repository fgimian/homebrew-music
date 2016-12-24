require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'spectrasonics-omnisphere' do
  version '2.3.1'
  sha256 '77dd2096aa0f3b5b2e8c06aab1c8910aa71b9adeddd98e5a73fd87ec28786864'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Spectrasonics/Spectrasonics Omnisphere v2/Mac/Omnisphere 2 Installer.pkg")
  name 'Spectrasonics Omnisphere'
  homepage 'https://www.spectrasonics.net/products/omnisphere/'

  pkg 'Omnisphere 2 Installer.pkg'

  uninstall pkgutil: 'net.spectrasonics.Omnisphere'

  zap delete: [
                '~/Library/Application Support/Spectrasonics',
                '~/Library/Preferences/net.spectrasonics.V6.plist'
              ]
end
