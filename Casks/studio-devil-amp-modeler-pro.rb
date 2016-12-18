require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'studio-devil-amp-modeler-pro' do
  version '1.5'
  sha256 '35c0924209c7f1d1c29b8709395a665246d21a01fc772aa57a8678dd239957d0'

  url URI::encode("file://#{base_dir}/Studio Devil/studiodevil_amp_v#{version.gsub('.', '_')}.dmg")
  name 'Studio Devil Amp Modeler Pro'
  homepage 'http://www.studiodevil.com/products/amp_modeler_pro/'

  pkg 'Install Studio Devil AMP.mpkg'

  uninstall pkgutil: [
                       'com.studiodevil.studiodevilamp.*',
                       'com.studiodevil.studiodevilampResources.*'
                     ]

  zap delete: [
                '~/Library/Preferences/com.studiodevil.amp.plist',
                '/Library/Application Support/StudioDevil/AMP'
              ]
end
