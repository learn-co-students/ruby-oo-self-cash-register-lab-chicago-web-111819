class Match
    attr_reader :initiator, :acceptor
    attr_accessor :winner

    # def winner=(new_winner)
    #     @winner = new_winner
    # end

    @@all = []

    def initialize(initiator, acceptor)
        @initiator = initiator
        @acceptor = acceptor
        @winner = nil
        @@all << self
    end

    def self.all
        @@all
    end

    def summary
        <<-OUTPUT
            *************************************
            This match pitted the challenger #{self.initiator.name}
            against the upstart #{acceptor.name}
            *************************************
            They fought and battled!

            And the winner was...

            #{self.winner.name}!
        OUTPUT
    end

    def declare_winner(winning_player)
        if [self.aceptor, self.initiator].include?(winning_player)
            self.winner = winning_player
        end
    end
end