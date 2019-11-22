class Player
attr_reader :name, :clan

    def initialize(name, clan)
        @name = name
        @clan = clan
    end

    def initiate_match_with(player)
        # Need to create a match for these two players
        # One player is provided by arg
        # Whichever player is calling THIS METHOD RIGHT NOW (self)
        # is the other one.
        Match.new(self, Player)
    end

    def initiated_matches
        Match.all.select do |match|
            match.initiator == self
    end

    def accepted_matches
        Match.all.select do |match|
            match.acceptor == self
    end

    def matches
        initiated_matches + accepted_matches
    end

    def won_matches
        Match.all.select do |match|
            match.winner == self
        end

    def opponents
        self.matches.map do |match|
            if match.acceptor == self
                opp = match.initiator
            elsif match.initiator == self
                opp = match.acceptor
            end
            opp
        end
    end
end
