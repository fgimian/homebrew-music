require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-fix-flanger-and-doubler' do
  version '2.4.63-20180620-19846-gtgoxp,279860'
  sha256 '7a2b7d67e0027caf5ff0d95444612617a2a28095a4bae0572d231106fe1dd6f6'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Fix_Flanger_and_Doubler-#{version.before_comma}.zip")
  name 'Softube Fix Flanger and Doubler'
  homepage 'https://www.softube.com/index.php?id=fixfd'

  pkg "Softube Fix Flanger and Doubler Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Fix_Flanger_and_Doubler.*'

  zap delete: [
                '~/Library/Application Support/Softube/Fix Doubler.txt',
                '~/Library/Application Support/Softube/Fix Flanger.txt',
                "/Library/Application Support/Softube/Softube Fix Flanger and Doubler Uninstaller #{version}.pkg",
              ]
end
