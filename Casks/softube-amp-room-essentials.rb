require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-amp-room-essentials' do
  version '2.4.74-20181029-28021-1g340xy,281289'
  sha256 '31e13c744e63f6288d1cd8343f3664e87b298ae3c0f558905d77c803a5b90f1c'

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
