cask 'steinberg-elicenser-control-center' do
  version :latest
  sha256 :no_check

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
