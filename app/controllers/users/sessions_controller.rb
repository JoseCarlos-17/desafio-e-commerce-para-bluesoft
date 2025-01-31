# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    # Rails.logger.info "=====> Entrou no Users::SessionsController#create"
    super
  end
end
