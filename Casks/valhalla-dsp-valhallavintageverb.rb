require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'valhalla-dsp-valhallavintageverb' do
  version '1.7.1'
  sha256 'ed7f62fb2c3e3bc654a9f991ceb065a08f725e7fe40e673944072252ee237ffe'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Valhalla DSP/ValhallaVintageVerbOSX_#{version.dots_to_underscores}.zip")
  name 'Valhalla DSP ValhallaVintageVerb'
  homepage 'http://valhalladsp.com/shop/plugins/valhalla-vintage-verb/'

  pkg "ValhallaVintageVerbOSX_#{version.dots_to_underscores}.pkg"

  uninstall pkgutil: "com.ValhallaDSP.valhallavintageverb#{version.no_dots}.*"

  zap delete: [
                '~/Library/Preferences/ValhallaVintageVerb.settings',
                '/Library/Application Support/Valhalla DSP, LLC/ValhallaVintageVerb',
              ]
end
