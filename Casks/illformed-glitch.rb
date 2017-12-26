require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'illformed-glitch' do
  version '2.1.0'
  sha256 '595417c5babe8d9abff33148a58010eff298e40fead2bd7504c8679bd199644b'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Illformed/Glitch_#{version.gsub('.', '_')}_Mac_Registered.zip")
  name 'Illformed Glitch'
  homepage 'https://illformed.com/glitch/'

  artifact 'Glitch2.vst', target: '/Library/Audio/Plug-Ins/VST/Glitch2.vst'
  artifact 'Glitch2.component', target: '/Library/Audio/Plug-Ins/Components/Glitch2.component'
  artifact 'Glitch2_Presets', target: '/Library/Audio/Presets/Illformed/Glitch'
  artifact 'Glitch2_Readme.txt', target: '/Library/Documentation/Illformed/Glitch2_Readme.txt'
  artifact 'Glitch2_User_Guide.pdf', target: '/Library/Documentation/Illformed/Glitch2_User_Guide.pdf'

  zap delete: [
                '~/Library/Logs/Glitch2.log',
                '~/Library/Preferences/Glitch2',
              ]
end
