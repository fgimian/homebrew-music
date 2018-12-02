require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'exponential-audio-r2-stereo-reverb' do
  version '5.0.0'
  sha256 'b1a798c0f6b2f5358bb737eddd08c7762bfb6d2412affaead6e20eb75014345d'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Exponential Audio/R2_Mac_Release_#{version}.dmg.zip")
  name 'Exponential Audio R2 Stereo Reverb'
  homepage 'https://www.exponentialaudio.com/r2-stereo/'

  pkg "R2Release_#{version}.pkg"

  uninstall pkgutil: [
                       'com.ExponentialAudio.R2*',
                       'com.ExponentialAudio.r2.*',
                     ]

  zap delete: [
                '~/Library/Application Support/ExponentialAudio/R2',
                '/Library/Logs/ExponentialAudio/R2Log.txt',
              ]
end
