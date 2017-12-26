require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'dmgaudio-trackcomp' do
  version '1.02'
  sha256 '032975e3a274295e14c83eb606395ff34c9ba31914c99a03a88e0497d08680a6'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/TrackCompMac_v#{version}.zip")
  name 'DMGAudio TrackComp'
  homepage 'https://dmgaudio.com/trackcomp'

  pkg "TrackCompMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackComp*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackComp',
                '~/Library/Preferences/com.dmgaudio.TrackComp.plist',
                '/Library/Application Support/DMGAudio/TrackComp',
              ]
end
