require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-cubase-pro-9v5' do
  version '9.5.0'
  sha256 'b7a6fe2cb0ba266bb0827977298046ec8f1bf64017299c310ddaa7bf96496e4c'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Steinberg/Cubase_9.5_Installer_mac.dmg")
  name 'Steinberg Cubase Pro 9.5'
  homepage 'https://www.steinberg.net/en/products/cubase'

  pkg 'Cubase for Mac/Cubase 9.5.pkg'

  uninstall pkgutil: [
                       'com.steinberg.*.cubase95',
                       'com.steinberg.AcousticAgentSEMixer',
                       'com.steinberg.AcousticAgentSEPatternBanks',
                       'com.steinberg.AcousticAgentSEStyleFiles',
                       'com.steinberg.Cubase9v5',
                       'com.steinberg.Documentation.hsse3',
                       'com.steinberg.Documentation.retrologue',
                       'com.steinberg.GrooveAgentFamily-SubPresetsShared',
                       'com.steinberg.GrooveAgentSE-SubPresets',
                       'com.steinberg.GrooveAgentSE',
                       'com.steinberg.HALionFamily-SubPresetsShared',
                       'com.steinberg.HALionIcon',
                       'com.steinberg.HALionLibraryManager',
                       'com.steinberg.HALionSonicSE-SubPresets',
                       'com.steinberg.HALionSonicSE.hsse3',
                       'com.steinberg.Padshop',
                       'com.steinberg.PadshopProVST3Presets',
                       'com.steinberg.PadshopSubPresets',
                       'com.steinberg.PadshopVST3Presets',
                       'com.steinberg.ReWire',
                       'com.steinberg.Retrologue',
                       'com.steinberg.Retrologue2VST3Presets',
                       'com.steinberg.RetrologueSubPresets',
                       'com.steinberg.RetrologueVST3Presets',
                       'com.steinberg.RockPopToolboxMIDIFiles',
                       'com.steinberg.RockPopToolboxPatternBanks',
                       'com.steinberg.UploadManager',
                       'com.steinberg.euconappsets',
                       'com.steinberg.euconvstxmls',
                       'com.steinberg.nuagevstxmls',
                       'com.steinberg.padshop.documentation',
                       'com.steinberg.vst3vsttransitextension',
                       'com.steinberg.vsttransitcore',
                       # The following relate to Retrologue & Padshop installers
                       'com.steinberg.Documentation',
                       'com.steinberg.PadshopAU',
                       'com.steinberg.PadshopAU.padshop',
                       'com.steinberg.RetrologueAU.retrologue',
                     ]

  zap delete: [
                '~/Library/Caches/com.steinberg.cubase9v5',
                '~/Library/Preferences/Application Files/Cubase 9.5',
                '~/Library/Preferences/com.steinberg.cubase9v5.plist',
                '~/Library/Preferences/Cubase 9.5',
              ]
end
