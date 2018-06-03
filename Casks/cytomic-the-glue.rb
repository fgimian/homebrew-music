require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'cytomic-the-glue' do
  version '1.3.19'
  sha256 '8c5d26b6e79b48593646b4df47ab13d7d7452589724a93fa4dc8dcd59c32c240'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Cytomic/TheGlue_v#{version}_Mac.dmg")
  name 'The Glue'
  homepage 'https://cytomic.com/index.php?q=glue'

  pkg 'Install The Glue.pkg'

  uninstall pkgutil: 'com.cytomic.pkg.TheGlue.*'

  zap delete: [
                '~/Library/Application Support/Cytomic/The Glue',
                '~/Library/Caches/The Glue',
              ]
end
