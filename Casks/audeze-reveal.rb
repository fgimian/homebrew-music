require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'audeze-reveal' do
  version '1.0.1'
  sha256 '2000cb86d15a9e42b4385d362497b340e53b5d6be5ce4d7b5cbdec1a8fae2d6a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Audeze/Audeze-Reveal_v#{version}-macOS.zip")
  name 'Audeze Reveal'
  homepage 'https://www.audeze.com/audeze-reveal-plugin'

  pkg "Audeze-Reveal_v#{version}-macOS.pkg"

  uninstall pkgutil: 'com.audeze-reveal.*'
end
