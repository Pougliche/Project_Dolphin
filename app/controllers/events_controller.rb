class EventsController < ApplicationController
    def index
        @events = Event.all
      end
    
      def show
          @event = Event.find(params[:id])
          puts @participants = @event.attendances
      end
    
      def new
        @event = Event.new
      end
    
      def edit
        @event = Event.find(params[:id])
      end
    
      def create
        @event = Event.new(event_params)
        @event.creator = current_user
    
          if @event.save
           redirect_to @event, notice: 'Event was successfully created.' 
          else
            render :new 
          end
      end
    
      def update
        @event = Event.find(params[:id])
          if @event.update(event_params)
            redirect_to @event, notice: 'Event was successfully updated.' 
          else
            render :edit 
          end
      end
    
      def destroy
        @event.destroy
        redirect_to events_url, notice: 'Event was successfully destroyed.' 
      end
    
      private
        
      def event_params
        params.require(:event).permit(:event_name, :description, :duration, :city, :game_played, :event_date, :max_participant)
      end

end
