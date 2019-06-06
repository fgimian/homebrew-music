require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'ableton-live-10-suite' do
  version '10.1'
  sha256 '063583b61c5ccd925a241a37bd52bee7406d704f642880b883cd36de6a762d10'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Ableton/ableton_live_suite_#{version}_64.dmg")
  name 'Ableton Live 10 Suite'
  homepage 'https://www.ableton.com/en/live/'

  app 'Ableton Live 10 Suite.app'

  zap delete: [
                "~/Library/Application Support/Ableton/Live #{version}",
                '~/Library/Application Support/Ableton/Live Database',
                '~/Library/Application Support/Ableton/Live Reports',
                '~/Library/Caches/Ableton',
                "~/Library/Preferences/Ableton/Live #{version}",
              ]
end
