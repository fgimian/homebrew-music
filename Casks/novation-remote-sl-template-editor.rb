require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'novation-remote-sl-template-editor' do
  version '1.3'
  sha256 '8f24b79a10a347509ba0b5134bb53fa08fb6d0bc88b8b83e854a135f7a685ab3'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'DAWs & Drivers',
      "Novation Remote SL Template Editor v#{version}",
      'remote-sl-template-editor-mac2.dmg'
    )
  )
  name 'Novation Remote SL Template Editor'
  homepage 'https://global.novationmusic.com/keys/sl-mkii'

  app 'ReMOTESLEditor.app'

  zap delete: [
                '~/Library/Preferences/ReMOTE SL Editor Preferences',
                '~/Library/Preferences/ReMOTESLEditor.plist'
              ]
end
