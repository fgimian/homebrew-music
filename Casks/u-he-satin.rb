cask 'u-he-satin' do
  # TODO: add full version Satin 1.3 (rev 4596)
  version '1.3.0'
  sha256 'a5f7e2ebce149cde891b3a39dea316726190517ca01034bcdc938bb2c5016415'

  # uhedownloads-heckmannaudiogmb.netdna-ssl.com was verified as official when first introduced to the cask
  url "https://uhedownloads-heckmannaudiogmb.netdna-ssl.com/Releases/Satin_#{version.gsub('.', '')}_4596_Mac.zip"
  name 'u-he Satin'
  homepage 'https://www.u-he.com/cms/satin'

  pkg 'Satin4596Mac/Satin 1.3.0.4596 Installer.pkg'

  uninstall pkgutil: 'com.u-he.Satin.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.Satin.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Satin.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Satin.plist',
                '/Library/Application Support/u-he/Satin',
              ]
end
