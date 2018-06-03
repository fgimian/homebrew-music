base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackds' do
  version '1.00'
  sha256 '2592765e60dba843be87bc925a7c5c8a3adaad843a53de5173eedb9b12a8c8ff'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/TrackDSMac_v#{version}.zip")
  name 'DMGAudio TrackDS'
  homepage 'https://dmgaudio.com/trackds'

  pkg "TrackDSMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackDS*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackDS',
                '~/Library/Preferences/com.dmgaudio.TrackDS.plist',
                '/Library/Application Support/DMGAudio/TrackDS',
              ]
end
