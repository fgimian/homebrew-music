require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'reveal-sound-spire' do
  version '1.1.14'
  sha256 '516b06662da85dd2a7dde9e0052fb569895cd84fce059f7cb93f6822063ce40e'

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
