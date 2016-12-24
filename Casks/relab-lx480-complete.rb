cask 'relab-lx480-complete' do
  version '2.2.3'
  sha256 '9e05b0a338c90df2c224e1aacf73ff6bd7046c41be2e5e479b6f520d850b329f'

  url 'http://www.relab.dk/public/products/LX480_Complete_mac.zip'
  name 'Relab LX480 Complete'
  homepage 'http://relab.dk/product/lx480-complete/'

  pkg 'LX480 Complete.pkg'

  uninstall pkgutil: 'com.relab.pkg.LX480Complete.*'

  zap delete: [
                '/Library/Application Support/Relab Development/LX480 Complete',
              ]
end