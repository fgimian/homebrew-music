require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'exponential-audio-r2-stereo-reverb' do
  version '3.0.7'
  sha256 '8b988e33a9427e08d828ef686fe2ee00e46ba8a83a2b077ce15ad6c786bbbf2f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Exponential Audio/R2_Mac_Release_#{version}.dmg.zip")
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
