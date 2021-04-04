class TeamsController < ApplicationController
    before_action :find_team, only: [:show, :edit, :update, :destroy, :optimal]

    def index
        # should only call on current_users teams...
        # @teams = current_user.teams
        @teams = Team.all
    end

    def show

    end

    def new
        @team = Team.new
        @league = League.find(params[:league_id])
        @team.players.build(position: "QB")
        @team.players.build(position: "RB")
        @team.players.build(position: "RB")
        @team.players.build(position: "WR")
        @team.players.build(position: "WR")
        @team.players.build(position: "TE")
        @team.players.build(position: "FLEX")
        @team.players.build(position: "D")
        @team.players.build(position: "K")
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
        roster_size = @team.players.length
        @team.update(team_params)
        new_roster_size = @team.players.length

        if new_roster_size > roster_size
            flash[:added] = "Added #{team_params[:players_attributes]["0"]["name"]}"
            redirect_to team_path(@team)
        else
            flash[:error] = "#{team_params[:players_attributes]["0"]["name"]} is already on your team."
            render :edit
        end

    end

    def optimal

    end


    def destroy
        @team.destroy
        redirect_to leagues_path
    end

    private

    def find_team
        @team = Team.find(params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :league_id, players_attributes: [:name])
    end
end
