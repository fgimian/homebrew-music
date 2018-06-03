base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-fet-compressor' do
  version '2.4.58-20180511-127254-1q94hcr,278857'
  sha256 'cfddc8cadd1fc5d088c6cb78c5bf8451e1b645439342cf761666b108aa4df280'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/FET_Compressor-#{version.before_comma}.zip")
  name 'Softube FET Compressor'
  homepage 'https://www.softube.com/index.php?id=fc'

  pkg "Softube FET Compressor Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_FET_Compressor.*'

  zap delete: [
                '/Library/Application Support/Softube/FET Compressor.txt',
                "/Library/Application Support/Softube/Softube FET Compressor Uninstaller #{version}.pkg",
                '/Library/Application Support/Softube/SSX/FET Compressor.ssx',
              ]
end
