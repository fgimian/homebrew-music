cask 'focusrite-control' do
  version '2.1.2'
  sha256 '6df82e3dd578d2ee6502bb3ba1c14754d573e1adf26fa8eb8fcb2f5029e5adec'

  url "https://d3se566zfvnmhf.cloudfront.net/sites/default/files/focusrite/downloads/31869/focusrite-control-#{version}.dmg"
  name 'Focusrite Control'
  homepage 'https://us.focusrite.com/clarett-range'

  pkg 'Focusrite Control.pkg'

  uninstall pkgutil: [
                       'com.focusrite.FocusriteControl.*',
                       'com.focusrite.pkg.FocusritePCIe.*'
                     ]

  zap delete: [
                '~/Library/Application Support/Focusrite/Focusrite Control',
                '~/Library/Logs/Focusrite Control',
                '/Library/Application Support/Focusrite/Focusrite Control'
              ]
end
