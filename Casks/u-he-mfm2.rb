require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'u-he-mfm2' do
  version '2.2.1'
  sha256 'ea9342b5a524f88a3e35da8c57b9d1187a00a0a7e0f36ce55f049edfcefef3dd'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'u-he',
      "u-he MFM2 v#{version}",
      "MFM2_#{version.gsub('.', '_')}_Mac.zip"
    )
  )
  name 'u-he MFM2'
  homepage 'https://www.u-he.com/cms/mfm2'

  pkg 'MFM23898Mac/MFM2 2.2.1.3898 Installer.pkg'

  uninstall pkgutil: 'com.u-he.MFM2.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.MFM2.*',
                '/Library/Application Support/u-he/MFM2'
              ]
end
