module Veewee
  module Provider
    module Virtualbox
      module BoxCommand

        def winrm_options
          port=definition.winrm_host_port
          if self.exists?
            forward=self.forwarding("guestwinrm")
            unless forward.nil?
              port=forward[:host_port]
            end
          end

          winrm_options={
            :user => definition.winrm_user,
            :pass => definition.winrm_password,
            :port => port,
            :basic_auth_only => true,
            :timeout => definition.winrm_login_timeout.to_i
          }
          return winrm_options

        end

      end
    end
  end
end
