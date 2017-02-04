cask 'sonalksis-essentials' do
  version '3.02'
  sha256 '2673e99d853e8a3b0faf421fb9c11090adb553c0c366074dad0f578fcf51c06a'

  # storage.googleapis.com/sienda-eu was verified as official when first introduced to the cask
  url 'https://storage.googleapis.com/sienda-eu/plugrepo/pluginmanager/Sonalksis%20Plugin%20Manager%20Offline%20Installer.zip'
  name 'Sonalksis Essentials'
  homepage 'https://www.sonalksis.com/plug-ins.html'

  depends_on cask: 'sonalksis-plugin-manager'

  stage_only true

  postflight do
    ['SV-315Mk2', 'SV-517Mk2', 'SV-719'].each do |product|
      # VST
      Dir.glob("/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/Sonalksis #{product}*.vst.zip") do |archive|
        system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Audio/Plug-Ins/VST'
      end
      # AU
      Dir.glob("/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/Sonalksis #{product}*.component.zip") do |archive|
        system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Audio/Plug-Ins/Components'
      end
      # RTAS
      Dir.glob("/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/Sonalksis #{product}*.dpm.zip") do |archive|
        system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Application Support/Digidesign/Plug-Ins'
      end
    end
  end

  uninstall pkgutil: 'com.sonalksis.pkg.PluginManagerOffline.*',
            delete:  [
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Mono Cmp SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Mono Cmp.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Stereo Cmp SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Stereo Cmp.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-517Mk2 Mono EQ.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-517Mk2 Stereo EQ.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Mono Gate SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Mono Gate.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Stereo Gate SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Stereo Gate.vst',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-315Mk2 Mono Cmp.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-315Mk2 Stereo Cmp.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-517Mk2 Mono EQ.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-517Mk2 Stereo EQ.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-719 Mono Gate.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-719 Stereo Gate.component',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-315Mk2 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-315Mk2 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-517Mk2 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-517Mk2 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-719 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-719 Stereo.dpm',
                     ]

  zap delete: [
                '~/Library/Application Support/Sonalksis/SV315Mk2.sonkpref',
                '~/Library/Application Support/Sonalksis/SV517Mk2.sonkpref',
                '~/Library/Application Support/Sonalksis/SV719.sonkpref',
              ]
end
