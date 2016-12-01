require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'synapse-audio-dune' do
  version '2.5.0.2'
  sha256 '9779af225b8074b3da8999ec68375aba515b857abeb0f55d0acd0139214e91a2'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Instrument)',
      'Synapse Audio',
      "Synapse Audio DUNE v#{version}",
      "dune#{version.gsub('.', '')}mac.dmg"
    )
  )
  name 'Synapse Audio DUNE'
  homepage 'http://www.synapse-audio.com/dune2.html'

  pkg 'Install DUNE 2.5 (AAX).pkg'
  pkg 'Install DUNE 2.5 (VST,AU).pkg'

  uninstall pkgutil: 'com.audiounit.SynapseAudio.DUNE2.*'

  zap delete: [
                '~/Library/Application Support/Synapse Audio/DUNE 2',
                '/Library/Application Support/Synapse Audio/.DUNE2reg',
                '/Library/Application Support/Synapse Audio/DUNE 2',
                '/Library/Application Support/Synapse Audio/RegisterDUNE25.app'
              ]
end
