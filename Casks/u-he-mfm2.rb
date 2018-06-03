base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-mfm2' do
  version '2.2.1,3898'
  sha256 'ea9342b5a524f88a3e35da8c57b9d1187a00a0a7e0f36ce55f049edfcefef3dd'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/u-he/MFM2_#{version.before_comma.dots_to_underscores}_Mac.zip")
  name 'u-he MFM2'
  homepage 'https://u-he.com/products/mfm2/'

  pkg "MFM2#{version.after_comma}Mac/MFM2 #{version.before_comma}.#{version.after_comma} Installer.pkg"

  uninstall pkgutil: 'com.u-he.MFM2.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.MFM2.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.MFM2.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.MFM2.plist',
                '/Library/Application Support/u-he/MFM2',
              ]
end
