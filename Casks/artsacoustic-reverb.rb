require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'artsacoustic-reverb' do
  version '1.6.0'
  sha256 '9cf6073196c890c7ba76c16548bdaa07a5d4a42955ad5493bf8097fca65cb505'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/ArtsAcoustic/ArtsAcousticReverb.dmg")
  name 'ArtsAcoustic Reverb'
  homepage 'http://www.artsacoustic.com/artsacoustic_reverb.php'

  pkg 'ArtsAcousticReverb.pkg', allow_untrusted: true

  uninstall pkgutil: 'com.artsacoustic.pkg.ArtsAcousticReverb*'

  zap delete: [
                '~/Library/Application Support/ArtsAcoustic/Reverb',
                '/Library/Application Support/ArtsAcoustic/Reverb',
              ]
end
