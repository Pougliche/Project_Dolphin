class GamesController < ApplicationController
    before_action :authenticate_user

    def index 
        @game = Game.all
    end
    
    def show
        @game = Game.find(params[:id])
        @players = @game.game_playeds
        @game_comments = GameComment.where(game: @game)
        @local_players = User.where(game_playeds: @players, city: current_user.city)
    end
 
    private
    
    def games_params
        params.permit(:sender_id, :recipient_id)
    end
end
