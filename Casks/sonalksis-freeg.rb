require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'sonalksis-freeg' do
  version '3.02'
  sha256 '2673e99d853e8a3b0faf421fb9c11090adb553c0c366074dad0f578fcf51c06a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Sonalksis/Sonalksis%20Plugin%20Manager%20Offline%20Installer.zip")
  name 'Sonalksis FreeG'
  homepage 'https://www.sonalksis.com/plug-ins.html'

  depends_on cask: 'sonalksis-plugin-manager'

  stage_only true

  postflight do
    # VST
    Dir.glob('/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/Sonalksis FreeG*.vst.zip') do |archive|
      system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Audio/Plug-Ins/VST'
    end
    # AU
    Dir.glob('/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/Sonalksis FreeG*.component.zip') do |archive|
      system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Audio/Plug-Ins/Components'
    end
    # RTAS
    Dir.glob('/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/Sonalksis FreeG*.dpm.zip') do |archive|
      system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Application Support/Digidesign/Plug-Ins'
    end
  end

  uninstall pkgutil: 'com.sonalksis.pkg.PluginManagerOffline.*',
            delete:  [
                       '/Library/Audio/Plug-Ins/VST/Sonalksis FreeG Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis FreeG Stereo.vst',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis FreeG Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis FreeG Stereo.component',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis FreeG Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis FreeG Stereo.dpm',
                     ]

  zap delete: [
                '~/Library/Application Support/Sonalksis/FreeG.sonkpref',
              ]
end
