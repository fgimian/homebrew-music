require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'modartt-pianoteq' do
  version '6.1.1'
  sha256 'c3f9607d9399e6ee2cbcb427287b318cb96969dd07e69875ed5d8411f81449f2'

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
