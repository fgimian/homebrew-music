require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'focusrite-control' do
  version '2.1.8'
  sha256 '11895e1c2551b6bd05328ab4021ba28020d956a451e0f3b26545c41a4e2c740b'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Focusrite/focusrite-control-#{version}.dmg")
  name 'Focusrite Control'
  homepage 'https://us.focusrite.com/clarett-range'

  pkg 'Focusrite Control.pkg'

  uninstall pkgutil: [
                       'com.focusrite.FocusriteControl.*',
                       'com.focusrite.pkg.FocusritePCIe.*',
                     ]

  zap delete: [
                '~/Library/Application Support/Focusrite/Focusrite Control',
                '~/Library/Logs/Focusrite Control',
                '/Library/Application Support/Focusrite/Focusrite Control',
              ]
end
