require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-enhanced-eq' do
  version '1.3.1'
  sha256 'f82a7f28bca88d071ca88cdf4651493728214409e94f128df6f7c48016289056'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Enhanced_EQ.iso")
  name 'Enhanced EQ'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/enhanced-eq/'

  pkg "Enhanced EQ #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.EnhancedEQ.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Enhanced EQ',
                '~/Library/Preferences/com.native-instruments.EnhancedEQ.plist',
                '/Library/Application Support/Native Instruments/Enhanced EQ',
                '/Library/Preferences/com.native-instruments.EnhancedEQ.plist',
              ]
end
