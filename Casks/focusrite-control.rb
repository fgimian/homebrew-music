require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'focusrite-control' do
  version '2.3.3'
  sha256 'd6f5b489694cdd2f5e392317add09be382b6990f45de7cbf626d0c97ba9a177b'

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
