require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-tube-delay' do
  version '2.4.11'
  sha256 '7152b826b8b16cfa1a87fb1e4c11c0eb5952a0fb10661585c95c230c35dd67a9'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Tube_Delay-2.4.11-20170330-7740-1jrq5u3.zip")
  name 'Softube Tube Delay'
  homepage 'https://www.softube.com/index.php?id=td'

  pkg 'Softube Tube Delay Installer 2.4.11 r270909.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Tube_Delay.*'

  zap delete: [
                '~/Library/Application Support/Softube/Tube Delay.txt',
                "/Library/Application Support/Softube/Softube Tube Delay Uninstaller #{version}.pkg",
              ]
end
