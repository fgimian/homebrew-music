base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'ableton-live-10-suite' do
  version '10.0.2'
  sha256 '94df1bcc1c5cc69a739aa1bf0eaac1651a528d37dbe3c62314d6937456ba6fb4'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Ableton/ableton_live_suite_#{version}_64.dmg")
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
