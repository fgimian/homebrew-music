require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'goodhertz-canopener-studio' do
  version '3.0.9-r4'
  sha256 '72156aa46a22313f5ee19269376fa166e5c6e9cee656c59080244b137f0f537d'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Goodhertz/Goodhertz-Installer-#{version}.pkg")
  name 'Goodhertz CanOpener Studio'
  homepage 'https://goodhertz.co/canopener-studio'

  pkg "Goodhertz-Installer-#{version}.pkg",
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
