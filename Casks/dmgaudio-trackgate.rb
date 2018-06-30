require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackgate' do
  version '1.01'
  sha256 '69d469836a666bb03de6715c710573ea1e835a4d7b11f19581c38840231db933'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/TrackGateMac_v#{version}.zip")
  name 'DMGAudio TrackGate'
  homepage 'https://dmgaudio.com/trackgate'

  pkg "TrackGateMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackGate*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackGate',
                '~/Library/Preferences/com.dmgaudio.TrackGate.plist',
                '/Library/Application Support/DMGAudio/TrackGate',
              ]
end
