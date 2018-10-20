require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'audeze-reveal' do
  version '1.0.2'
  sha256 '4949184f4692f853528f6b7c988e8a19566c86c0641e579f88222d4239dcbfb0'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Audeze/Audeze-Reveal_v#{version}-macOS.zip")
  name 'Audeze Reveal'
  homepage 'https://www.audeze.com/audeze-reveal-plugin'

  pkg "Audeze-Reveal_v#{version}-macOS.pkg"

  uninstall pkgutil: 'com.audeze-reveal.*'
end
