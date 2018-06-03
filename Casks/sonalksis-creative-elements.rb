base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'sonalksis-creative-elements' do
  version '3.02'
  sha256 '2673e99d853e8a3b0faf421fb9c11090adb553c0c366074dad0f578fcf51c06a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Sonalksis/Sonalksis Plugin Manager Offline Installer.zip")
  name 'Sonalksis Creative Elements'
  homepage 'https://www.sonalksis.com/plug-ins.html'

  depends_on cask: 'sonalksis-plugin-manager'

  postflight do
    ['Creative Filter', 'Digital Grimebox', 'Uber Compressor'].each do |product|
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
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Creative Filter Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Creative Filter Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Digital Grimebox Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Digital Grimebox Stereo.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Uber Compressor Mono.vst',
                       '/Library/Audio/Plug-Ins/VST/Sonalksis Uber Compressor Stereo.vst',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Creative Filter Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Creative Filter Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Digital Grimebox Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Digital Grimebox Stereo.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Uber Compressor Mono.component',
                       '/Library/Audio/Plug-Ins/Components/Sonalksis Uber Compressor Stereo.component',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Creative Filter Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Creative Filter Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Digital Grimebox Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Digital Grimebox Stereo.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Uber Compressor Mono.dpm',
                       '/Library/Application Support/Digidesign/Plug-Ins/Sonalksis Uber Compressor Stereo.dpm',
                     ]

  zap delete: [
                '~/Library/Application Support/Sonalksis/CreativeFilter.sonkpref',
                '~/Library/Application Support/Sonalksis/DigitalGrimebox.sonkpref',
                '~/Library/Application Support/Sonalksis/UberCompressor.sonkpref',
              ]
end
