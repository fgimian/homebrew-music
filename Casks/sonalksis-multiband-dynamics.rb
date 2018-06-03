base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'sonalksis-multiband-dynamics' do
  version '3.02'
  sha256 '2673e99d853e8a3b0faf421fb9c11090adb553c0c366074dad0f578fcf51c06a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Sonalksis/Sonalksis Plugin Manager Offline Installer.zip")
  name 'Sonalksis Multi-band Dynamics'
  homepage 'https://www.sonalksis.com/plug-ins.html'

  depends_on cask: 'sonalksis-plugin-manager'

  postflight do
    ['CQ1', 'DQ1'].each do |product|
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
                       '/Library/Audio/Plug-Ins/VST/Sonalksis CQ1 Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis CQ1 Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis DQ1 Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis DQ1 Stereo.vst',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis CQ1 Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis CQ1 Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis DQ1 Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis DQ1 Stereo.component',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis CQ1 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis CQ1 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis DQ1 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis DQ1 Stereo.dpm',
                     ]

  zap delete: [
                '~/Library/Application Support/Sonalksis/CQ1.sonkpref',
                '~/Library/Application Support/Sonalksis/DQ1.sonkpref',
              ]
end
