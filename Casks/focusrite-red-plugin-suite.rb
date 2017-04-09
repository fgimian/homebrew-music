require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'focusrite-red-plugin-suite' do
  version '1.10'
  sha256 '689c57b36d47d41c929cf2aa6bd1e4f0826160f76b85200b49c399a7b4e9ba3c'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Focusrite/red-2-red-3-plug-in-suite-#{version}.dmg")
  name 'Focusrite Red Plugin Suite'
  homepage 'https://us.focusrite.com/plug-ins/red-plug-in-suite'

  pkg 'Red 2 & Red 3 Plug-in Suite Installer.pkg'

  uninstall pkgutil: 'com.Focusrite.*.pkg.Red2Red3Plug-*'

  zap delete: [
                '~/Music/Focusrite/Activation/Red2Red3Plugin.txt',
              ]
end
