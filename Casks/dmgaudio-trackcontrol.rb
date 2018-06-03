base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackcontrol' do
  version '1.00'
  sha256 '2d8beb3d1809e32d326d02c38ffa5e035c9586722dc910bc6c927b52d621221d'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/TrackControlMac_v#{version}.zip")
  name 'DMGAudio TrackControl'
  homepage 'https://dmgaudio.com/trackcontrol'

  pkg "TrackControlMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackControl*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackControl',
                '~/Library/Preferences/com.dmgaudio.TrackControl.plist',
                '/Library/Application Support/DMGAudio/TrackControl',
              ]
end
