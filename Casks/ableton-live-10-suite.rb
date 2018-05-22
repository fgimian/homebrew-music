require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'ableton-live-10-suite' do
  version '10.0.1'
  sha256 '73f8b7d9c2e058639466cbb765e6e1610f97f542745e2c69567d7bf55a407e11'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Ableton/ableton_live_suite_#{version}_64.dmg")
  name 'Ableton Live 10 Suite'
  homepage 'https://www.ableton.com/'

  app 'Ableton Live 10 Suite.app'

  zap delete: [
                "~/Library/Application Support/Ableton/Live #{version}",
                '~/Library/Application Support/Ableton/Live Database',
                '~/Library/Application Support/Ableton/Live Reports',
                '~/Library/Caches/Ableton',
                "~/Library/Preferences/Ableton/Live #{version}",
              ]
end
