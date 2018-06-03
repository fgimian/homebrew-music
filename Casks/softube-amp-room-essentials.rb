base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-amp-room-essentials' do
  version '2.4.58-20180511-127254-1mb2ilb,278857'
  sha256 'e0c9ca8a754f8d457feebfb0664b84c6874643482dc7bbb443aa9b5808820311'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Amp_Room_Essentials-#{version.before_comma}.zip")
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
