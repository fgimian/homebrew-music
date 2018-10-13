require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'cytomic-the-drop' do
  version '1.5.8'
  sha256 '73a542f04cf2f0e5173472b91fbdc6360d2fa3bff02856f08a8adff6a8d44a3f'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Cytomic/TheDrop_v#{version}_Mac.dmg")
  name 'Cytomic The Drop'
  homepage 'https://cytomic.com/#plugins'

  pkg 'Install The Drop.pkg'

  uninstall pkgutil: 'com.cytomic.pkg.TheDrop.*'

  zap delete: [
                '~/Library/Application Support/Cytomic/The Drop',
                '~/Library/Caches/The Drop',
              ]
end
