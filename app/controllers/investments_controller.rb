class InvestmentsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :validate_total_money,  only: [:create]
  before_action :validate_project, only: [:create]
  def authenticate_user
    @user = User.find_by(email:params[:email])
    if @user.nil? || @user.pin != params[:pin]
      flash[:notice] = "Yanlış email/pin kombinasyonu, tekrar deneyiniz."
      return redirect_to new_investment_path
    end
  end

  def validate_total_money
    total = 0

    if !params[:investment].nil?
      total_investment_count = params[:investment][:favs_attributes].values.length
      params[:investment][:favs_attributes].values.each do |v|
        total += v[:money].to_i
      end
      if total != 100000
        flash[:notice] = "Toplam yatırım tutarı 100.000 olmalıdır."
        return redirect_to new_investment_path
      elsif total_investment_count > 10 || total_investment_count < 2
        flash[:notice] = "En fazla 10, en az 2 projeye yatırım yapılabilir."
        return redirect_to new_investment_path
      end
    else
      flash[:notice] = "Yeni Yatırım butonuna basarak en az iki projeye yatırım yapmalısınız."
      return redirect_to new_investment_path
    end
  end

  def validate_project
    params[:investment][:favs_attributes].values.each do |v|
      if v[:project_id].blank?
        flash[:notice] = "Proje Adı alanı boş bırakılamaz"
        return redirect_to new_investment_path
      end
    end
  end


  def new
    @investment = Investment.new
    @projects = Project.all
  end

  def create
      @investment = Investment.create(strong_params)
      @investment.user_id = @user.id
      @investment.save
      return redirect_to users_path
  end

  def index
  end
  private
  def strong_params
    params.require(:investment).permit(:user_id, favs_attributes: [:project_id, :money, :investment_id, :_destroy 
                                   ])  
  end
end
