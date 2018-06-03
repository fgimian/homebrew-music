require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'goodhertz-canopener-studio' do
  version '3.2.0-r2'
  sha256 'c2c0999bdfec34bb54a96120aa7c2806e58aa948ebd1c7377e54870d83d8c22e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Goodhertz/Goodhertz-Installer-#{version.hyphens_to_underscores}.pkg")
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
