require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'artsacoustic-cl-series' do
  version '1.0.19'
  sha256 'c95c4b929fccbcf0664f83413538450ddc053806be2f49bb3f2216c4f1add9f6'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'ArtsAcoustic',
      "ArtsAcoustic CL Series v#{version}",
      'ArtsAcousticCLSeries.dmg'
    )
  )
  name 'ArtsAcoustic CL Series'
  homepage 'http://www.artsacoustic.com/artsacoustic_clseries.php'

  pkg 'ArtsAcoustic CL Series.mpkg'

  uninstall pkgutil: 'com.artsacoustic.pkg.aacls.*'

  zap delete: [
                '~/Library/Application Support/ArtsAcoustic/CL Series'
              ]
end
