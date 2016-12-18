cask 'ableton-live-9-suite' do
  version '9.7.1'
  sha256 '6570bc21368a5db953e1a1bdbf62477f393733aa15e8d58bc26a3f2ebe776af0'

  url "http://cdn2-downloads.ableton.com/channels/#{version}/ableton_live_suite_#{version}_64.dmg"
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
