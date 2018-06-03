base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackgate' do
  version '1.00'
  sha256 'c46c45b3fdda106e37ad291a02355ff44da142c774bde800f14bbbdeaf23ac25'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/TrackGateMac_v#{version}.zip")
  name 'DMGAudio TrackGate'
  homepage 'https://dmgaudio.com/trackgate'

  pkg "TrackGateMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackGate*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackGate',
                '~/Library/Preferences/com.dmgaudio.TrackGate.plist',
                '/Library/Application Support/DMGAudio/TrackGate',
              ]
end
