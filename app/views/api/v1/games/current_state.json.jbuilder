json.game_score @game.score_for(@current_user)&.value
json.frames_count @game.frames_count

json.frames do
  json.array! @game.frames.where(user: @current_user) do |frame|
    json.partial! "api/v1/frames/frame", frame: frame
  end
end
