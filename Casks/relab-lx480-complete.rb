require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'relab-lx480-complete' do
  version '2.2.5'
  sha256 '7cda120b84986be2dc381cdd1fdf8e7104538d9ba7d9ca8d0c85c0d5c526664e'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Relab/LX480_Complete_mac.zip")
  name 'Relab LX480 Complete'
  homepage 'http://relab.dk/product/lx480-complete/'

  pkg "LX480 Complete v#{version}.pkg"

  uninstall pkgutil: 'com.relab.pkg.LX480Complete.*'

  zap delete: [
                '/Library/Application Support/Relab Development/LX480 Complete',
              ]
end
