cask 'native-instruments-native-access' do
  version :latest
  sha256 :no_check

  url 'https://www.native-instruments.com/fileadmin/downloads/Native_Access_Installer.dmg'
  name 'Native Instruments Native Access'
  homepage 'https://www.native-instruments.com/en/specials/native-access/'

  app 'Native Access.app'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Native Access',
                '~/Library/Caches/Native Instruments/Native Access',
                '~/Library/Preferences/com.native-instruments.Native Access.plist',
                '~/Library/Saved Application State/com.native-instruments.Native Access.savedState',
                '/Library/Application Support/Native Instruments/Service Center/NativeAccess.xml',
              ]
end
