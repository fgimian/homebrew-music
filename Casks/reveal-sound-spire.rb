require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'reveal-sound-spire' do
  version '1.1.13'
  sha256 '3c6dbc07f6b62f0a8106720bea2d4fb94a818481f9521abb5402da80a8c1b861'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Reveal Sound/Spire-#{version}-Mac.zip")
  name 'Reveal Sound Spire'
  homepage 'http://www.reveal-sound.com/'

  pkg 'install_aax.pkg'
  pkg 'install_au.pkg'
  pkg 'install_vst.pkg'

  uninstall pkgutil: 'com.revealsound.spire.1.1.*'

  zap delete: [
                '~/Library/Application Support/RevealSound',
              ]
end
