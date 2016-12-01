require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'ableton-live-9-suite' do
  version '9.7'
  sha256 '35fa16a2c703d458fc005413e81e7fccd3ebf18eff5bffea91eb9165db42c400'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'DAWs & Drivers',
      "Ableton Live 9 Suite v#{version}",
      "ableton_live_suite_#{version}_64.dmg"
    )
  )
  name 'Ableton Live 9 Suite'
  homepage 'https://www.ableton.com/'

  app 'Ableton Live 9 Suite.app'

  zap delete: [
                "~/Library/Application Support/Ableton/Live #{version}",
                '~/Library/Application Support/Ableton/Live Reports',
                '~/Library/Caches/Ableton',
                '~/Library/Caches/com.ableton.live',
                '~/Library/Cookies/com.ableton.live.binarycookies',
                "~/Library/Preferences/Ableton/Live #{version}",
                '~/Library/Preferences/com.ableton.live.plist'
              ]
end
