require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'modartt-pianoteq' do
  version '6.3.0'
  sha256 '559055ba4766a5a6a68a1602319a773bcc9cbdab263b1a84629c5fa70dce40ae'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Modartt/pianoteq_setup_v#{version.no_dots}.dmg")
  name 'Modartt Pianoteq'
  homepage 'https://www.pianoteq.com/pianoteq6'

  depends_on formula: 'xz'

  pkg 'Install Pianoteq 6.app/Contents/Resources/Install Pianoteq 6.mpkg'

  preflight do
    system("/usr/local/bin/unlzma '#{staged_path}/Install Pianoteq 6.app/Contents/Resources/Install Pianoteq 6.mpkg/Contents/Archive.pax.lzma'")
  end

  uninstall pkgutil: 'com.modartt.Pianoteq6.pkg'

  zap delete: [
                '`/Library/Application Support/Modartt/Pianoteq',
                '`/Library/Application Support/Modartt/Pianoteq60.prefs',
              ]
end
