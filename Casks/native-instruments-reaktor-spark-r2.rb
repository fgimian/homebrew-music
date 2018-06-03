require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-reaktor-spark-r2' do
  version '1.4.0'
  sha256 '96566e03c8c5cce4d1cb1e4e8e045470b795d2d7776bf823759673f842df26f8'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Reaktor_Spark_R2.iso")
  name 'Reaktor Spark R2'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-spark/'

  pkg "Reaktor Spark R2 #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'ReaktorSparkR2_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.ReaktorSparkR2.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor Spark R2',
                '~/Library/Preferences/com.native-instruments.ReaktorSparkR2.plist',
                '/Library/Application Support/Native Instruments/Reaktor Spark R2',
                '/Library/Preferences/com.native-instruments.ReaktorSparkR2.plist',
              ]
end
