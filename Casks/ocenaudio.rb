cask 'ocenaudio' do
  version '3.2.1'
  sha256 '07acc2b7d7f55af24906193ac64a47b543a9cfc5aff974cc523437ca00523999'

  url 'https://www.ocenaudio.com/start_download/ocenaudio64.dmg'
  name 'ocenaudio'
  homepage 'https://www.ocenaudio.com/'

  app 'ocenaudio.app'

  zap delete: [
                '~/Library/Application Support/ocenaudio',
                '~/Library/Caches/br.com.ocenaudio.app.ocenvst32',
                '~/Library/Caches/br.com.ocenaudio.app.ocenvst64',
                '~/Library/Preferences/br.com.ocenaudio.plist',
                '~/Library/Saved Application State/br.com.ocenaudio.savedState',
              ]
end
