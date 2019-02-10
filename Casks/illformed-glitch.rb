require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'illformed-glitch' do
  version '2.1.1'
  sha256 '0ed7106be3e66d92c5e195a144b8b11655eba015a4d70c5d2f9da560a9a21332'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Illformed/Glitch_#{version.dots_to_underscores}_Mac_Registered.zip")
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
