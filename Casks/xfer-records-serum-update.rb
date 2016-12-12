require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'xfer-records-serum-update' do
  version '1.11b3'
  sha256 '72dd741d2c18497a8fe8fe5fd3994aa85540decaf94206ab1488f29fc57a20d0'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Instrument)',
      'Xfer Records',
      "Xfer Records Serum v#{version} (Update)",
      "Install_Xfer_Serum_Update_#{version.gsub('.', '')}.dmg"
    )
  )
  name 'Xfer Records Serum (Update)'
  homepage 'https://www.xferrecords.com/products/serum'

  pkg 'Install_Xfer_Serum.pkg'
end
