cask 'dmgaudio-tracklimit' do
  version '1.00'
  sha256 'd4899462e868bd34536ae370a4c65f66b5ef2470c7b354f0434a6ea887984572'

  url "https://dmgaudio.com/dl/TrackLimit_v#{version}/TrackLimitMac_v#{version}.zip"
  name 'DMGAudio TrackLimit'
  homepage 'https://dmgaudio.com/products_TrackLimit.php'

  pkg "TrackLimitMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackLimit*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackLimit',
                '~/Library/Preferences/com.dmgaudio.TrackLimit.plist',
                '/Library/Application Support/DMGAudio/TrackLimit',
              ]
end
