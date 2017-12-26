require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'valhalladsp-valhallavintageverb' do
  version '1.7.1'
  sha256 'ed7f62fb2c3e3bc654a9f991ceb065a08f725e7fe40e673944072252ee237ffe'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/ValhallaDSP/ValhallaVintageVerbOSX_#{version.gsub('.', '_')}.zip")
  name 'ValhallaDSP ValhallaVintageVerb'
  homepage 'http://valhalladsp.com/shop/plugins/valhalla-vintage-verb/'

  pkg "ValhallaVintageVerbOSX_#{version.gsub('.', '_')}.pkg"

  uninstall pkgutil: "com.ValhallaDSP.valhallavintageverb#{version.gsub('.', '')}.*"

  zap delete: [
                '~/Library/Preferences/ValhallaVintageVerb.settings',
                '/Library/Application Support/Valhalla DSP, LLC/ValhallaVintageVerb',
              ]
end
