require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'sound-radix-muteomatic' do
  version '1.0.0'
  sha256 '67496d8ebf7f38ed8636a78a9ee391d7335c1e3be428badf0d9324a15ae0b020'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Sound Radix',
      "Sound Radix Muteomatic v#{version}",
      'Muteomatic-Installer.pkg'
    )
  )
  name 'Sound Radix Muteomatic'
  homepage 'https://www.soundradix.com/products/muteomatic/'

  pkg 'Muteomatic-Installer.pkg'

  uninstall pkgutil: 'Muteomatic.*'

  zap delete: [
              ]
end
