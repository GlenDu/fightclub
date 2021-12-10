class UserCombatsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show] 
  
  def new
    @user_combat = UserCombat.new
    @result = params_join
  end

  def create
    @user_current = User.find(current_user.id) 
    var_name =  params[:combat]
    combat_selected = Combat.find_by(combat: var_name)
    combat_selected_id =  combat_selected.id
    
    @user_combat = UserCombat.create(user_id: @user_current, combat_id: combat_selected_id)
  end

  def show
    @show_user_combat = UserCombat.find(params[:id])
  end

  private

  def params_join
       
  end

end