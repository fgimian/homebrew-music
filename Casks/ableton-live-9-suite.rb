require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'ableton-live-9-suite' do
  version '9.7.5'
  sha256 '12ad48293cd326a1d1982e2877a50cd21ee4a747d987ad68cead23081287aaea'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Ableton/ableton_live_suite_#{version}_64.dmg")
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
                '~/Library/Preferences/com.ableton.live.plist',
              ]
end
