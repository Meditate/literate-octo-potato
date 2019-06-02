class Frame::Creator < ApplicationService
  def initialize(attributes)
    @attributes = attributes

    @user = attributes[:user]
    @game = attributes[:game]
  end

  def call
    if @user.can_have_a_frame?(@game)
      handle_new_frame
    else
      raise ArgumentError, "User can't have a frame in this game"
    end

    frame
  end

  def frame
    @frame ||= Frame.new(@attributes)
  end

  private

  def handle_new_frame
    unless @game.score_for(@user)
      handle_new_score
    end

    frame.build_sequence
    frame.save!
  end

  def handle_new_score
    Score.create!(game: @game, user: @user)
  end
end
