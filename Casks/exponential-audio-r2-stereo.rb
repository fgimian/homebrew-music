require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'exponential-audio-r2-stereo' do
  version '3.0.4'
  sha256 '2caa427a15288d2cec44cdb4cda4a93ef0fbe44f980ef233e73a80004e86d198'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Exponential Audio/R2_Mac_Release_#{version}.dmg.zip")
  name 'Exponential Audio R2 Stereo'
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
