cask 'relab-lx480-complete' do
  version '2.2.4'
  sha256 'd7c7f23bccaf899b8814b070b4213be8cb43c53b13faa4682927743bca066e5f'

  url 'http://www.relab.dk/public/products/LX480_Complete_mac.zip'
  name 'Relab LX480 Complete'
  homepage 'http://relab.dk/product/lx480-complete/'

  pkg "LX480 Complete v#{version}.pkg"

  uninstall pkgutil: 'com.relab.pkg.LX480Complete.*'

  zap delete: [
                '/Library/Application Support/Relab Development/LX480 Complete',
              ]
end
