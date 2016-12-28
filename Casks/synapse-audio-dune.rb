require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'synapse-audio-dune' do
  version '2.5.0.2'
  sha256 '9779af225b8074b3da8999ec68375aba515b857abeb0f55d0acd0139214e91a2'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Synapse Audio/dune#{version.gsub('.', '')}mac.dmg")
  name 'Synapse Audio DUNE'
  homepage 'http://www.synapse-audio.com/dune2.html'

  pkg 'Install DUNE 2.5 (AAX).pkg',
      choices: [
                 # Disable 'Synapse Audio DUNE 2.5 (AAX) Postflight' so that
                 # the register app isn't started after installation.
                 {
                   'choiceIdentifier' => 'choice10',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
               ]
  pkg 'Install DUNE 2.5 (VST,AU).pkg',
      choices: [
                 # Disable 'Synapse Audio DUNE 2.5 Postfligh' so that
                 # the register app isn't started after installation.
                 {
                   'choiceIdentifier' => 'choice6',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
               ]

  uninstall pkgutil: [
                       'com.audiounit.SynapseAudio.DUNE2.*',
                       'com.audiounit.SynapseAudio.SynSerials2.pkg',
                       'com.audiounit.SynapseAudio.SynSerials25.pkg',
                     ]

  zap delete: [
                '~/Library/Application Support/Synapse Audio/DUNE 2',
                '/Library/Application Support/Synapse Audio/.DUNE2reg',
                '/Library/Application Support/Synapse Audio/DUNE 2',
                '/Library/Application Support/Synapse Audio/RegisterDUNE25.app',
              ]
end
