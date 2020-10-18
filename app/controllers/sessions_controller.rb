class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    #  set_flash_message!(:notice, "Привет " << current_user.full_name << '!')
    flash[:notice] = I18n.t('common.hello') << " " << current_user.full_name << '!' if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
end
