cask 'audiomove' do
  version '1.21'
  sha256 '5b5b632d213e897bda1de36e757a273419d69db1b351e014d1b0eddd06e73eda'

  url "https://public.msli.com/lcs/audiomove/AudioMove#{version}_MacOS_Intel.zip"
  name 'AudioMove'
  homepage 'https://public.msli.com/lcs/audiomove/'

  app "AudioMove#{version}_MacOS_Intel/AudioMove.app"

  zap delete: [
                '~/.audiomove_settings',
                '~/Library/Saved Application State/com.yourcompany.AudioMove.savedState'
              ]
end
