class Api::V1::ThrowsController::CreateFacade
  attr_writer :user, :params

  def initialize(user, params)
    @user = user
    @params = params
  end

  def save
    ActiveRecord::Base.transaction do
      create_throw
      handle_score_for(throw_instance)
    end
  end

  def throw_instance
    throw_creator.throw_instance
  end

  private

  def game
    @game ||= Game.find_by!(key: @params[:game_key])
  end

  def frame
    @frame ||= Frame.find_by(frame_attributes) || handle_new_frame
  end


  def frame_attributes
    {
      user: @user,
      status: 0,
      game: game
    }
  end

  def throw_attributes
    {
      frame: frame,
      score: @params[:score]
    }
  end

  def handle_new_frame
    frame_creator.call
  end

  def create_throw
    throw_creator.call
  end

  def handle_score_for(throw_object)
    User::ScoreUpdater.call(@user, game, throw_object)
  end

  def throw_creator
    @throw_creator ||= Throw::Creator.new(throw_attributes)
  end

  def frame_creator
    @Frame_creator ||= Frame::Creator.new(frame_attributes)
  end
end
