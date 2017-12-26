require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'modartt-pianoteq' do
  version '6.0.3'
  sha256 'a7812c54aa804bd1a3cd83ed18e5a6894cead246cd2d23fda7e5528bc4a86bbb'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Modartt/pianoteq_setup_v#{version.no_dots}.dmg")
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
