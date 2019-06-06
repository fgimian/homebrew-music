require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'xfer-records-serumfx-update' do
  version '1.25b2'
  sha256 'bf5042a0bd66d6230cee312ed7ec707070c4dae15e6d529c7bf8bf677dd332e6'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Xfer Records/Install_Xfer_SerumFX_Update_#{version.no_dots}.dmg")
  name 'Xfer Records SerumFX (Update)'
  homepage 'https://www.xferrecords.com/products/serum'

  depends_on cask: 'xfer-records-serum'

  pkg 'Install_Xfer_SerumFX.pkg'
end
