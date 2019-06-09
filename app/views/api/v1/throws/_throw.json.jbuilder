json.extract! throw_instance, :score, :attempt_number, :presentation

json.frame do
  json.partial! "api/v1/frames/frame", frame: throw_instance.frame
end

