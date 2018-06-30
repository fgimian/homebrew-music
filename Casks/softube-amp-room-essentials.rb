require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-amp-room-essentials' do
  version '2.4.63-20180620-19846-1mdh2m6,279860'
  sha256 'e7d0bbdc66797c45d72e0355866357cb4311db9e416a72130687c4fca44cec05'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Amp_Room_Essentials-#{version.before_comma}.zip")
  name 'Softube Amp Room Essentials'
  homepage 'https://www.softube.com/index.php?id=arb'

  pkg "Softube Amp Room Essentials Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Amp_Room_Essentials.*'

  zap delete: [
                '~/Library/Application Support/Softube/Bass Amp Room 8x10.txt',
                '~/Library/Application Support/Softube/Vintage Amp Room Half-Stack.txt',
                "/Library/Application Support/Softube/Softube Amp Room Essentials Uninstaller #{version}.pkg",
              ]
end
