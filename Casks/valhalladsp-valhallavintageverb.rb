require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'valhalladsp-valhallavintageverb' do
  version '1.5.0'
  sha256 '649f536cd8d53051e71c4ed7f1ab385635712449e522845c646161aa235490d7'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/ValhallaDSP/ValhallaVintageVerbOSX_#{version.gsub('.', '_')}dot3.zip")
  name 'ValhallaDSP ValhallaVintageVerb'
  homepage 'http://valhalladsp.com/shop/plugins/valhalla-vintage-verb/'

  pkg "ValhallaVintageVerbOSX_#{version.gsub('.', '_')}dot3.mpkg"

  uninstall pkgutil: "com.ValhallaDSP.valhallavintageverb#{version.gsub('.', '')}.*"

  zap delete: [
                '~/Library/Preferences/ValhallaVintageVerb.settings',
                '/Library/Application Support/Valhalla DSP, LLC/ValhallaVintageVerb',
              ]
end
