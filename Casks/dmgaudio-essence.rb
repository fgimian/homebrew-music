cask 'dmgaudio-essence' do
  version '1.04'
  sha256 'f4a40dda8689986679ebb668c5e2f659578d3dd47061baa19ed7846291e8586c'

  url "https://dmgaudio.com/dl/Essence_v#{version}/EssenceMac_v#{version}.zip"
  name 'DMGAudio Essence'
  homepage 'https://dmgaudio.com/products_essence.php'

  pkg "EssenceMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Essence*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Essence',
                '~/Library/Preferences/com.dmgaudio.Essence.plist',
                '/Library/Application Support/DMGAudio/Essence',
              ]
end
