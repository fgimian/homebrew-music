cask 'steinberg-elicenser-control-center' do
  version '6.11.3.1236'
  sha256 '8c386fd68fa5decb83f75a520502ca01a8396d08f843fc41c44036f57095538e'

  url 'http://download.steinberg.net/downloads/eLicenserControl.dmg'
  name 'Steinberg eLicenser Control Center'
  homepage 'https://www.steinberg.net/en/company/technologies/elicenser.html'

  installer script: 'eLicenserControlSetup.app/Contents/MacOS/installbuilder.sh',
            args:   ['--mode', 'unattended'],
            sudo:   true

  uninstall pkgutil: 'com.syncrosoft.installer.licensecontro'

  zap delete: [
                '~/Library/Saved Application State/com.eLicenser.POS.savedState',
                '~/Library/Saved Application State/net.eLicenser.installer.eLicenserControl.savedState',
              ]
end
