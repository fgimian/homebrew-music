base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-echoboy-jr' do
  version '5.2.0.12502'
  sha256 'f73da1341b3babf5a744b6de5ab007628453f1e6280c740cfe2f4667cbad732f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Soundtoys/EchoBoyJr5_#{version}.dmg")
  name 'Soundtoys EchoBoy Jr.'
  homepage 'https://www.soundtoys.com/product/echoboy-jr/'

  pkg 'Install EchoBoy Jr..pkg'

  uninstall pkgutil: 'com.soundtoys.com.soundtoys.EchoBoyJr5'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
