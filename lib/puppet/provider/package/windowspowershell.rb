require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'puppet_x', 'encore', 'powershellmodule', 'helper.rb'))

Puppet::Type.type(:package).provide(:windowspowershell, parent: :powershellcore) do
  desc "Provider to be used on systems with powershell 5.1 or lower. 'PowerShell'"
  initvars
  confine operatingsystem: :windows
  confine feature: :powershellgetwindows
  has_feature :installable, :uninstallable, :upgradeable, :versionable, :install_options
  commands powershell: 'powershell'

  def self.invoke_ps_command(command)
    PuppetX::PowerShellModule::Helper.instance.powershell(command)
  end
end
