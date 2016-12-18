cask 'cytomic-the-drop' do
  version '1.0.16'
  sha256 '8158eab8d6e1f42260b94e4a33ef2539b323128d0f4c2518b85569ef705977cd'

  url "https://cytomic.com/filedownload/TheDrop_v#{version}_Mac.dmg"
  name 'The Drop'
  homepage 'https://cytomic.com/#plugins'

  pkg 'Install The Drop.pkg'

  uninstall pkgutil: 'com.cytomic.pkg.TheDrop.*'

  zap delete: [
                '~/Library/Application Support/Cytomic/The Drop',
                '~/Library/Caches/The Drop',
              ]
end
