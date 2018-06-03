base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'focusrite-control' do
  version '2.3.4'
  sha256 '03540de1770e8f6f04754e707b95d3535e477ab86f2175b3eb962e6687e27996'

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
