require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'valhalladsp-valhallaspacemodulator' do
  version '1.0.7'
  sha256 'e146ba622b15bacc73b1b6d93caa499502cfd471d4324b671aabfbedc7ca6df2'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/ValhallaDSP/VSM_OSX_#{version.gsub('.', '_')}.zip")
  name 'ValhallaDSP ValhallaSpaceModulator'
  homepage 'http://valhalladsp.com/shop/modulation/valhalla-space-modulator/'

  pkg "ValhallaSpaceModulatorOSX_#{version.gsub('.', '_')}.pkg"

  uninstall pkgutil: "com.ValhallaDSP.valhallaspacemodulator#{version.gsub('.', '')}.*"

  zap delete: [
                '/Library/Application Support/Valhalla DSP, LLC/ValhallaSpaceModulator',
              ]
end
