class User::ScoreUpdater < ApplicationService
  def initialize(user, game, throw_object)
    @user = user
    @game = game
    @throw = throw_object
  end

  def call
    Sequence.active_for_user_in_game(@user, @game).each do |sequence|
      handle_sequence(sequence)
    end
  end

  private

  def handle_sequence(sequence)
    create_sequence_throw(sequence)

    if sequence.throws.count < 3 && sequence.score >= 10
      sequence.update(number_of_throws: 3)
      sequence.frame.finished! unless sequence.frame.last_in_game?
    end

    sequence.complete! if sequence.completed_with_throws?
  end

  def create_sequence_throw(sequence)
    SequencesThrow.create!(sequence: sequence, throw: @throw)
  end
end 
