require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'focusrite-control' do
  version '2.1.2'
  sha256 '6df82e3dd578d2ee6502bb3ba1c14754d573e1adf26fa8eb8fcb2f5029e5adec'

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
