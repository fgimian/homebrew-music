require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'exponential-audio-r2-stereo-reverb' do
  version '6.0.0'
  sha256 'fbbad4a9f0f8444a52a4d0b138ca683915fa5199deef1bd35a0b8411968eb4ab'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Exponential Audio/Exponential_Audio_R2Release_#{version.major}_#{version.minor_patch.no_dots}.dmg")
  name 'Exponential Audio R2 Stereo Reverb'
  homepage 'https://www.izotope.com/en/products/exponential-audio-reverbs/r2.html'

  pkg "R2Release_#{version}/R2Release_#{version}.pkg"

  uninstall pkgutil: [
                       'com.ExponentialAudio.R2*',
                       'com.ExponentialAudio.r2.*',
                     ]

  zap delete: [
                '~/Library/Application Support/ExponentialAudio/R2',
                '/Library/Logs/ExponentialAudio/R2Log.txt',
              ]
end
