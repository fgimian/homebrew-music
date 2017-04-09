require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'goodhertz-canopener-studio' do
  version '2.0.1-r2'
  sha256 'ebb51edb878a6d9fa13f89f0975cd8908b07cf75a48209b3d4683d7b088023ec'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Goodhertz/Goodhertz-Installer-v#{version}.pkg")
  name 'Goodhertz CanOpener Studio'
  homepage 'https://goodhertz.co/canopener-studio'

  pkg "Goodhertz-Installer-v#{version}.pkg",
      choices: [
                 # Disable 'Vulf Compressor 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_2',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Tone Control 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_3',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Trem Control 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_4',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Lossy 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_5',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Lohi 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_6',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Faraday Limiter 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_7',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Panpot 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_8',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Good Dither 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_9',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Tiltshift 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_10',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Midside 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_11',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Midside Matrix 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_12',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Wow Control 2 AU'
                 {
                   'choiceIdentifier' => 'installer_choice_1_13',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Vulf Compressor 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_2',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Tone Control 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_3',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Trem Control 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_4',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Lossy 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_5',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Lohi 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_6',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Faraday Limiter 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_7',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Panpot 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_8',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Good Dither 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_9',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Tiltshift 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_10',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Midside 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_11',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Midside Matrix 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_12',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 # Disable 'Wow Control 2 AAX'
                 {
                   'choiceIdentifier' => 'installer_choice_2_13',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
               ]

  uninstall pkgutil: 'com.goodhertz.pkg.ghz2-CanOpenerStudio-CS2X-*'

  zap delete: [
                '~/Music/.GDHZ',
              ]
end
