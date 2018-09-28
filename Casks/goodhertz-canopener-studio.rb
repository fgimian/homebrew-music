require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'goodhertz-canopener-studio' do
  version '3.3.1-r2'
  sha256 'd58dc0f118b22b86fccd5919e932885068e5091e555dd3aa8268efecf9f009e7'

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
