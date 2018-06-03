base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-tracklimit' do
  version '1.00'
  sha256 'd4899462e868bd34536ae370a4c65f66b5ef2470c7b354f0434a6ea887984572'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/TrackLimitMac_v#{version}.zip")
  name 'DMGAudio TrackLimit'
  homepage 'https://dmgaudio.com/tracklimit'

  pkg "TrackLimitMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackLimit*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackLimit',
                '~/Library/Preferences/com.dmgaudio.TrackLimit.plist',
                '/Library/Application Support/DMGAudio/TrackLimit',
              ]
end
