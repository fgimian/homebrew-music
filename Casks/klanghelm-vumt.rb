require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'klanghelm-vumt' do
  version '2.1.2'
  sha256 'dc321d394b3c6318794a5e2924a816b4dd6d68d6920bbf2b6d1137b9f470300c'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Klanghelm/VUMT-mac-installer.zip")
  name 'Klanghelm VUMT'
  homepage 'http://klanghelm.com/contents/products/VUMT/VUMT.php'

  container nested: 'VUMT.dmg'

  artifact 'VUMT.component', target: '/Library/Audio/Plug-Ins/Components/VUMT.component'
  artifact 'VUMT.vst', target: '/Library/Audio/Plug-Ins/VST/VUMT.vst'
  artifact 'VUMT.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/VUMT.aaxplugin'
  artifact 'license.rtf', target: '/Library/Documentation/Klanghelm/VUMT/license.rtf'
  artifact 'changelog.txt', target: '/Library/Documentation/Klanghelm/VUMT/changelog.txt'
  artifact 'VUMT-manual.pdf', target: '/Library/Documentation/Klanghelm/VUMT/VUMT-manual.pdf'

  zap delete: '~/Library/Klanghelm/VUMT'
end
