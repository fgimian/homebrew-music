require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'sonalksis-studio-one-bundle' do
  version '3.02'
  sha256 '2673e99d853e8a3b0faf421fb9c11090adb553c0c366074dad0f578fcf51c06a'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Sonalksis',
      "Sonalksis Studio One Bundle v#{version}",
      "Sonalksis Plugin Manager Offline Installer.zip"
    )
  )
  name 'Sonalksis Studio One Bundle'
  homepage 'https://www.sonalksis.com/plug-ins.html'

  pkg 'Sonalksis Plugin Manager Offline Installer.pkg'

  postflight do
    # VST
    Dir.glob('/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/*.vst.zip') do |archive|
      system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Audio/Plug-Ins/VST'
    end
    # AU
    Dir.glob('/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/*.component.zip') do |archive|
      system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Audio/Plug-Ins/Components'
    end
    # RTAS
    Dir.glob('/Library/Application Support/Sonalksis/PluginManagerOfflineRepository/components/MAC/*.dpm.zip') do |archive|
      system '/usr/bin/unzip', '-qq', archive, '-d', '/Library/Application Support/Digidesign/Plug-Ins'
    end
  end

  uninstall pkgutil: 'com.sonalksis.pkg.PluginManagerOffline.*'
            delete:  [
                       '/Library/Audio/Plug-Ins/VST/Sonalksis CQ1 Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis CQ1 Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Creative Filter Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Creative Filter Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis DQ1 Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis DQ1 Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Digital Grimebox Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Digital Grimebox Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis FreeG Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis FreeG Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis MaxLimit Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis MaxLimit.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis MultiLimit.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315 Mono Cmp.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315 Stereo Cmp.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Mono Cmp SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Mono Cmp.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Stereo Cmp SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-315Mk2 Stereo Cmp.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-517 Mono EQ.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-517 Stereo EQ.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-517Mk2 Mono EQ.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-517Mk2 Stereo EQ.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Mono Gate SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Mono Gate.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Stereo Gate SC.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis SV-719 Stereo Gate.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis StereoTools.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Uber Compressor Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Uber Compressor Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Ultimate-D.vst',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis CQ1 Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis CQ1 Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Creative Filter Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Creative Filter Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis DQ1 Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis DQ1 Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Digital Grimebox Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Digital Grimebox Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis FreeG Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis FreeG Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis MaxLimit Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis MaxLimit.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis MultiLimit.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-315 Mono Cmp.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-315 Stereo Cmp.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-315Mk2 Mono Cmp.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-315Mk2 Stereo Cmp.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-517 Mono EQ.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-517 Stereo EQ.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-517Mk2 Mono EQ.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-517Mk2 Stereo EQ.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-719 Mono Gate.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis SV-719 Stereo Gate.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis StereoTools.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Uber Compressor Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Uber Compressor Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Ultimate-D.component',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis CQ1 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis CQ1 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Creative Filter Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Creative Filter Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis DQ1 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis DQ1 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Digital Grimebox Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Digital Grimebox Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis FreeG Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis FreeG Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis MaxLimit Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis MaxLimit.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis MultiLimit.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-315 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-315 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-315Mk2 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-315Mk2 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-517 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-517 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-517Mk2 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-517Mk2 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-719 Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis SV-719 Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis StereoTools.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Uber Compressor Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Uber Compressor Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Ultimate-D.dpm'
                     ]

  zap delete: [
                '~/Library/Application Support/Sonalksis'
              ]
end
