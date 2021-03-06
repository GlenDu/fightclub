class BetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bet = Bet.all
  end

  def new
    @beting = Bet.new
    @fight_selected = Combat.find(params["combat"]) 
  end

  def create
    user_id_selected = User.find_by(selected_user).id
    @id_user_combat = UserCombat.find_by(user_id: user_id_selected, combat_id: params[:bet][:combat_id]).id
    @beting = Bet.new(sum_bet: params[:bet][:sum_bet], user_combat_id: @id_user_combat, user_id: current_user.id)

    if @beting.sum_bet >= current_user.compte.credits
      flash[:erreur] = "Error no bet was taken !"
      redirect_to bets_path
    elsif @beting.save
      @account_current_user = current_user.compte
      new_balance = @account_current_user.credits - @beting.sum_bet
      @account_current_user.update(credits: new_balance)
      redirect_to bet_path(@beting), notice: "Your bett has been registred!"
    else
      flash[:erreur] = "Error no bet was taken !"
      redirect_to bets_path
    end
  end

  def show
    fighter_id = Bet.find(params[:id]).user_id

    if fighter_id == current_user.id
      @show_bet = Bet.find(params[:id])
      @user_beted = User.find(@show_bet.user_id)
    else
      flash[:error] = "You're not at the right page"
      redirect_to combats_path
    end
  end

  private

    def selected_user
      params.require(:bet).permit(:pseudo)
    end
end
