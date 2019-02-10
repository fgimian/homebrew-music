require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'synapse-audio-dune' do
  version '2.6'
  sha256 '1a3ba4aba089129840104d6ffef09e4a879b66d16886bed86c869bdf1ea65c91'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Synapse Audio/dune#{version.no_dots}mac.dmg")
  name 'Synapse Audio DUNE'
  homepage 'http://www.synapse-audio.com/dune2.html'

  pkg 'Install DUNE 2 (AAX).pkg',
      choices: [
                 # Disable 'Synapse Audio DUNE 2.5 (AAX) Postflight' so that
                 # the register app isn't started after installation.
                 {
                   'choiceIdentifier' => 'choice10',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
               ]
  pkg 'Install DUNE 2 (VST,AU).pkg',
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
                       'com.audiounit.SynapseAudio.SynSerials26.pkg',
                     ]

  zap delete: [
                '~/Library/Application Support/Synapse Audio/DUNE 2',
                '/Library/Application Support/Synapse Audio/.DUNE2reg',
                '/Library/Application Support/Synapse Audio/DUNE 2',
                '/Library/Application Support/Synapse Audio/RegisterDUNE25.app',
              ]
end
