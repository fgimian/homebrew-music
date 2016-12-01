require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'dmgaudio-pitchfunk' do
  version '1.12'
  sha256 'c745379209b894e9bf6978b5333c6cdae54ebed7f0ef0c67bc23291910087ee4'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'DMGAudio',
      "DMGAudio PitchFunk v#{version}",
      "PitchFunkMac_v#{version}.zip"
    )
  )
  name 'DMGAudio PitchFunk'
  homepage 'https://dmgaudio.com/products_pitchfunk.php'

  pkg "PitchFunkMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.PitchFunk*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/PitchFunk',
                '~/Library/Preferences/com.dmgaudio.PitchFunk.plist',
                '/Library/Application Support/DMGAudio/PitchFunk'
              ]
end
