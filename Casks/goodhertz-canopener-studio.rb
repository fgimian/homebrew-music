require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'goodhertz-canopener-studio' do
  version '3.1.0-r1'
  sha256 '5294acbf6dd79437d3808af15d097851bec5cdb77c009b673a2d9c372de10e6a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Goodhertz/Goodhertz-Installer-#{version.hyphens_to_underscores}.pkg")
  name 'Goodhertz CanOpener Studio'
  homepage 'https://goodhertz.co/canopener-studio'

  pkg "Goodhertz-Installer-#{version.hyphens_to_underscores}.pkg",
      choices: [
                 # Disable AU
                 {
                   'choiceIdentifier' => 'installer_choice_1',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable AAX
                 {
                   'choiceIdentifier' => 'installer_choice_2',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable VST
                 {
                   'choiceIdentifier' => 'installer_choice_3',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable VST3
                 {
                   'choiceIdentifier' => 'installer_choice_4',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Enable AU / CanOpener
                 {
                   'choiceIdentifier' => 'installer_choice_1_1',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 1,
                 },
                 # Enable AAX / CanOpener
                 {
                   'choiceIdentifier' => 'installer_choice_2_1',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 1,
                 },
                 # Enable VST / CanOpener
                 {
                   'choiceIdentifier' => 'installer_choice_3_1',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 1,
                 },
                 # Enable VST3 / CanOpener
                 {
                   'choiceIdentifier' => 'installer_choice_4_1',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 1,
                 },
               ]

  uninstall pkgutil: 'com.goodhertz.pkg.CS3X-*'

  zap delete: [
                '~/Library/Preferences/com.goodhertz.plist',
              ]
end
