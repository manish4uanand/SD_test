class SecretCodesController < ApplicationController
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def assign_email_to_code
    @secret_code = SecretCode.find_by_code(params[:code])
    @secret_code.update(:email => params[:email])
  end

  def generate_code
    count = params[:code_count].to_i
    
    count.times do
      o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      string = (0...50).map { o[rand(o.length)] }.join
      secret_code_params = {"code" => string}
      @secret_code = SecretCode.new(secret_code_params)
      @secret_code.save
    end
  end

  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_codes = SecretCode.paginate(:page => params[:page], per_page: 5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret_code
      @secret_code = SecretCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_code_params
      params.require(:secret_code).permit(:code)
    end
end
