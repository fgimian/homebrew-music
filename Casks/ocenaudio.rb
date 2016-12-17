cask 'ocenaudio' do
  version '3.1.10'
  sha256 'ab11474299de7b48f1c413614146183d89b2f131a8161e993c1abb062e241f55'

  url 'https://www.ocenaudio.com/start_download/ocenaudio64.dmg'
  name 'ocenaudio'
  homepage 'https://www.ocenaudio.com/'

  app 'ocenaudio.app'

  zap delete: [
                '~/Library/Application Support/ocenaudio',
                '~/Library/Caches/br.com.ocenaudio.app.ocenvst32',
                '~/Library/Caches/br.com.ocenaudio.app.ocenvst64',
                '~/Library/Preferences/br.com.ocenaudio.plist',
                '~/Library/Saved Application State/br.com.ocenaudio.savedState'
              ]
end
