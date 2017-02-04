cask 'sonalksis-plugin-manager' do
  version '3.02'
  sha256 '2673e99d853e8a3b0faf421fb9c11090adb553c0c366074dad0f578fcf51c06a'

  # storage.googleapis.com/sienda-eu was verified as official when first introduced to the cask
  url 'https://storage.googleapis.com/sienda-eu/plugrepo/pluginmanager/Sonalksis%20Plugin%20Manager%20Offline%20Installer.zip'
  name 'Sonalksis Studio One Bundle'
  homepage 'https://www.sonalksis.com/plug-ins.html'

  pkg 'Sonalksis Plugin Manager Offline Installer.pkg'

  uninstall pkgutil: 'com.sonalksis.pkg.PluginManagerOffline.*'

  zap delete: [
                '~/Library/Application Support/Sonalksis',
              ]
end
