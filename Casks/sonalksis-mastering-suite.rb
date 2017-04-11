require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'sonalksis-mastering-suite' do
  version '3.02'
  sha256 '2673e99d853e8a3b0faf421fb9c11090adb553c0c366074dad0f578fcf51c06a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Sonalksis/Sonalksis Plugin Manager Offline Installer.zip")
  name 'Sonalksis Mastering Suite'
  homepage 'https://www.sonalksis.com/plug-ins.html'

  depends_on cask: 'sonalksis-plugin-manager'

  stage_only true

  postflight do
    ['MultiLimit', 'MaxLimit', 'StereoTools', 'Ultimate-D'].each do |product|
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
                       '/Library/Audio/Plug-Ins/VST/Sonalksis MaxLimit Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis MaxLimit.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis MultiLimit.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis StereoTools.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Ultimate-D.vst',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis MaxLimit Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis MaxLimit.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis MultiLimit.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis StereoTools.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Ultimate-D.component',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis MaxLimit Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis MaxLimit.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis MultiLimit.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis StereoTools.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Ultimate-D.dpm',
                     ]

  zap delete: [
                '~/Library/Application Support/Sonalksis/MaxLimit.sonkpref',
                '~/Library/Application Support/Sonalksis/MultiLimit.sonkpref',
                '~/Library/Application Support/Sonalksis/StereoTools.sonkpref',
                '~/Library/Application Support/Sonalksis/Ultimate-D.sonkpref',
              ]
end
