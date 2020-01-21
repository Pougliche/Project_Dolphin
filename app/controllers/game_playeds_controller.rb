class GamePlayedsController < ApplicationController
    before_action :authenticate_user
    before_action :find_game, only: [:create]
  
    def index
      @game_playeds = GamePlayed.all
    end
  
    
    def show
    end
  
    def new
      @game_playeds = GamePlayed.new
    end
  
    def edit
    end
  
    def create
      if already_play?
        flash[:danger] = "Il n'est pas possible de s'inscrire plusieurs fois a un même jeu"
        redirect_to game_path(@game)
      else
        @game.game_playeds.create(user_id: current_user.id)
        redirect_to game_path(@game), flash: {success: 'Super, vous etes insrit a un nouvel jeu !'}
      end
    end
  
    def destroy
      find_game_played
      if @game_played.destroy
      end
        redirect_to games_path, flash: {danger: 'Vous etes desinscrit de ce jeu !'}
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      
      def find_game_played
        @game_played = GamePlayed.where(user: current_user, game: params[:game_id]).first
      end
  
      def find_game
        @game = Game.find(params[:game_id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def attendance_params
        params.require(:game_played).permit(:id, :user, :game)
      end
  
      def already_play?
        GamePlayed.where(user: current_user, game: params[:game_id]).exists?
      end
end
