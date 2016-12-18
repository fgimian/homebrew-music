require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'steinberg-cubase-pro-9' do
  version '9.0.0'
  sha256 'a4bd3e636cf6dfa105dfbdbcda9c67775398b7ec482b2ae309ddbef0f48ffadf'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Steinberg/Cubase_9_Installer_mac.dmg")
  name 'Steinberg Cubase Pro'
  homepage 'https://www.steinberg.net/en/products/cubase'

  pkg 'Cubase for Mac/Cubase 9.pkg'

  uninstall pkgutil: [
                       'com.steinberg.*.cubase9',
                       'com.steinberg.AcousticAgentSEMixer',
                       'com.steinberg.AcousticAgentSEPatternBanks',
                       'com.steinberg.AcousticAgentSEStyleFiles',
                       'com.steinberg.Cubase9',
                       'com.steinberg.Cubase9AeppScripts',
                       'com.steinberg.Documentation',
                       'com.steinberg.euconappsets',
                       'com.steinberg.euconvstxmls',
                       'com.steinberg.GrooveAgentFamily-SubPresetsShared',
                       'com.steinberg.GrooveAgentSE',
                       'com.steinberg.GrooveAgentSE-SubPresets',
                       'com.steinberg.halion.icons',
                       'com.steinberg.HALionFamily-SubPresetsShared',
                       'com.steinberg.HALionSonicSE',
                       'com.steinberg.HALionSonicSE-SubPresets',
                       'com.steinberg.Padshop',
                       'com.steinberg.PadshopAU',
                       'com.steinberg.PadshopAU.padshop',
                       'com.steinberg.PadshopProVST3Presets',
                       'com.steinberg.PadshopSubPresets',
                       'com.steinberg.PadshopVST3Presets',
                       'com.steinberg.Retrologue',
                       'com.steinberg.Retrologue2VST3Presets',
                       'com.steinberg.RetrologueAU',
                       'com.steinberg.RetrologueAU.retrologue',
                       'com.steinberg.RetrologueDocumentation',
                       'com.steinberg.RetrologueSubPresets',
                       'com.steinberg.RetrologueVST3Presets',
                       'com.steinberg.ReWire',
                       'com.steinberg.RockPopToolboxMIDIFiles',
                       'com.steinberg.RockPopToolboxPatternBanks',
                       'com.steinberg.UploadManager',
                       'com.steinberg.vst3vsttransitextension',
                       'com.steinberg.vsttransitcore',
                     ]

  zap delete: [
                '~/Library/Caches/com.steinberg.cubase9',
                '~/Library/Preferences/Application Files/Cubase 9',
                '~/Library/Preferences/com.steinberg.cubase9.plist',
                '~/Library/Preferences/Cubase 9',
              ]
end
