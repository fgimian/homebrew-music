require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'artsacoustic-bigrock' do
  version '1.0.7'
  sha256 '494ff42de4ee86d78fddf4d4c608d64e53b6a38db7b3d85853779587b43db515'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'ArtsAcoustic',
      "ArtsAcoustic BigRock v#{version}",
      'ArtsAcousticBigRock.dmg'
    )
  )
  name 'ArtsAcoustic BigRock'
  homepage 'http://www.artsacoustic.com/artsacoustic_bigrock.php'

  pkg 'ArtsAcoustic BigRock.mpkg'

  uninstall pkgutil: 'com.artsacoustic.pkg.aabr.*'

  zap delete: [
                '~/Library/Application Support/ArtsAcoustic/BigRock'
              ]
end
