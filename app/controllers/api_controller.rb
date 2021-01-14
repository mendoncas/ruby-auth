class ApiController < ApplicationController
  def find_default
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      default = Default.find_by(user: user_id)
    end
  end

  def require_default
    if !find_default
      render json: { error: "você deve ser um paciente para realizar essa ação" }
    end
  end

  def find_adm
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @admin = Admin.find_by(user: user_id)
    end
  end

  def require_adm
    if !find_adm
      render json: { error: "você não tem permissão pra isso" }
    end
  end

  def find_physio
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      physio = Physio.find_by(user: user_id)
    end
  end

  def require_physio
    if !find_physio
      render json: { error: "você deve ser um fisioterapeuta para realizar essa ação" }
    end
  end
end
