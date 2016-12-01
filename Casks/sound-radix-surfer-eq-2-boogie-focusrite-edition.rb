require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'sound-radix-surfer-eq-2-boogie-focusrite-edition' do
  version '1.0.0'
  sha256 '690d51a03bbd2976b0fc1b2cf0a2b37293f30d884c3293c33cd64f56ca3f385e'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Sound Radix',
      "Sound Radix Surfer EQ 2 Boogie Focusrite Edition v#{version}",
      'SurferEQ2Boogie-Installer.pkg'
    )
  )
  name 'Sound Radix Surfer EQ 2 Boogie Focusrite Edition'
  homepage 'https://www.soundradix.com/products/surfer-eq/'

  pkg 'SurferEQ2Boogie-Installer.pkg'

  uninstall pkgutil: 'SurferEQBoogie.*'

  zap delete: [
              ]
end
