cask 'reveal-sound-spire' do
  version '1.1.9'
  sha256 '916941d4d1b8a5060b107b7e2dfdd0378ada4c47b3c1abe58f557c223a1cbcf0'

  url "http://www.reveal-sound.com/downloads/distrib/Spire-#{version}-Mac.zip"
  name 'Reveal Sound Spire'
  homepage 'http://www.reveal-sound.com/'

  pkg 'install_aax.pkg'
  pkg 'install_au.pkg'
  pkg 'install_vst.pkg'

  uninstall pkgutil: 'com.revealsound.spire.1.1.*'

  zap delete: [
                '~/Library/Application Support/RevealSound'
              ]
end
