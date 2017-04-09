cask 'reveal-sound-spire' do
  version '1.1.11'
  sha256 '057d00e8e738bab7d2503780f493c50a07972d2835b0b1d4ef3b57b4185d8165'

  url "http://www.reveal-sound.com/downloads/distrib/Spire-#{version}-Mac.zip"
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
