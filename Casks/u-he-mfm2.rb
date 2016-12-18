cask 'u-he-mfm2' do
  version '2.2.1'
  sha256 'ea9342b5a524f88a3e35da8c57b9d1187a00a0a7e0f36ce55f049edfcefef3dd'

  # uhedownloads-heckmannaudiogmb.netdna-ssl.com was verified as official when first introduced to the cask
  url "https://uhedownloads-heckmannaudiogmb.netdna-ssl.com/Releases/MFM2_#{version.gsub('.', '_')}_Mac.zip"
  name 'u-he MFM2'
  homepage 'https://www.u-he.com/cms/mfm2'

  pkg 'MFM23898Mac/MFM2 2.2.1.3898 Installer.pkg'

  uninstall pkgutil: 'com.u-he.MFM2.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.MFM2.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.MFM2.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.MFM2.plist',
                '/Library/Application Support/u-he/MFM2',
              ]
end
