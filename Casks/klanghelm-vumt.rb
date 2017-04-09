require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'klanghelm-vumt' do
  version '2.1.1'
  sha256 'c9380a9c9fd7057fba0c66c9af13264f869eeec937d019eccfb4204fef6d1c95'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Klanghelm/VUMT-mac-installer.zip")
  name 'Klanghelm VUMT'
  homepage 'http://klanghelm.com/contents/products/VUMT/VUMT.php'

  container nested: 'VUMT-mac.dmg'

  pkg 'VUMT Installer.pkg'

  uninstall pkgutil: 'com.Klanghelm.*.pkg.VUMT2'

  zap delete: '~/Library/Klanghelm/VUMT'
end
