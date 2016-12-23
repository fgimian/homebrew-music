cask 'dmgaudio-trackds' do
  version '1.00'
  sha256 '2592765e60dba843be87bc925a7c5c8a3adaad843a53de5173eedb9b12a8c8ff'

  url "https://dmgaudio.com/dl/TrackDS_v#{version}/TrackDSMac_v#{version}.zip"
  name 'DMGAudio TrackDS'
  homepage 'https://dmgaudio.com/products_TrackDS.php'

  pkg "TrackDSMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackDS*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackDS',
                '~/Library/Preferences/com.dmgaudio.TrackDS.plist',
                '/Library/Application Support/DMGAudio/TrackDS',
              ]
end
