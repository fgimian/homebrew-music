base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'xfer-records-serumfx-update' do
  version '1.21b5'
  sha256 'f0d14fcabd7bd3955ea6fec86426a658f62447ed420c5a177e5c177b932a4e9f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Xfer Records/Install_Xfer_SerumFX_Update_#{version.no_dots}.dmg")
  name 'Xfer Records SerumFX (Update)'
  homepage 'https://www.xferrecords.com/products/serum'

  depends_on cask: 'xfer-records-serum'

  pkg 'Install_Xfer_SerumFX.pkg'
end
