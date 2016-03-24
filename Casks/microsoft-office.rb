cask 'microsoft-office' do
  version '15.19.1-160212'
  sha256 'ca40b69fc17d20ba3597a2b567883673ef35994c0077808a9c9f988b8172719d'

  url 'http://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_2016_Installer.pkg'
  name 'Microsoft Office 2016'
  homepage 'https://www.microsoft.com/mac'
  license :commercial

  pkg 'Microsoft_Office_2016_Installer.pkg'

  uninstall pkgutil:   [
                         'com.microsoft.package.*',
                         'com.microsoft.pkg.licensing',
                       ],
            launchctl: 'com.microsoft.office.licensingV2.helper.plist'

  zap       delete: [
                      '/Library/LaunchDaemons/com.microsoft.office.licensingV2.helper.plist',
                      '/Library/PrivilegedHelperTools/com.microsoft.office.licensingV2.helper',
                      '/Library/Preferences/com.microsoft.office.licensingV2.plist',
                      '~/Library/Preferences/com.microsoft.autoupdate2.plist',
                    ],
            rmdir:  [
                      '~/Library/Containers/com.microsoft.Office365ServiceV2',
                      '~/Library/Group Containers/UBF8T346G9.*',
                    ]
end
