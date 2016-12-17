cask 'cytomic-the-glue' do
  version '1.3.12'
  sha256 '881ac2ab4a9eb8e68c5c98d31162d69aedc33fe16d681e0b803f5fa6498cf4b7'

  url "https://cytomic.com/filedownload/TheGlue_v#{version}_Mac.dmg"
  name 'The Glue'
  homepage 'https://cytomic.com/index.php?q=glue'

  pkg 'Install The Glue.pkg'

  uninstall pkgutil: 'com.cytomic.pkg.TheGlue.*'

  zap delete: [
                '~/Library/Application Support/Cytomic/The Glue',
                '~/Library/Caches/The Glue'
              ]
end
