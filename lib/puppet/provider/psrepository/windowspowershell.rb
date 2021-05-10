require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'puppet_x', 'encore', 'powershellmodule', 'helper.rb'))

Puppet::Type.type(:psrepository).provide(:windowspowershell, parent: :powershellcore) do
  desc 'Provider for managing powershell repositories on systems with powershell version 5.1 or lower.'
  initvars
  confine operatingsystem: :windows
  confine feature: :powershellgetwindows
  commands powershell: 'powershell'

  def self.invoke_ps_command(command)
    PuppetX::PowerShellModule::Helper.instance.powershell(command)
  end
end
