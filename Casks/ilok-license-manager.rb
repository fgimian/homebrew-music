cask 'ilok-license-manager.rb' do
  version :latest
  sha256 :no_check

  url 'http://installers.ilok.com/iloklicensemanager/LicenseSupportInstallerMac.zip'
  name 'iLok License Manager'
  homepage 'https://ilok.com/'

  pkg 'License Support.pkg'

  zap delete: [
                '~/Library/Caches/com.paceap.iLokLicenseManager',
                '~/Library/Preferences/com.paceap.iLokLicenseManager.plist',
                '~/Library/Saved Application State/com.paceap.eden.iLokLicenseManager.savedState'
              ]
end
