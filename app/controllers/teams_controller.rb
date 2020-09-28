class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :edit, :update, :destroy]

    def index
        # should only call on current_users teams...
        # @teams = current_user.teams
        @teams = Team.all
    end

    def show

    end

    def new
        @team = Team.new
    end

    def create
        team = @current_user.teams.create(team_params)
        if team.valid?
            redirect_to team_path(team)
        else
            render :new
        end
    end

    def edit

    end

    def update
        @team.update(team_params)
    end

    def destroy
        @team.destroy
    end

    private

    def find_team
        @team = Team.find(params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :league_id)
    end
end
