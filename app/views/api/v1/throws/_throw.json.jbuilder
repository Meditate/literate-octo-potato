json.extract! throw_object, :score, :attempt_number

json.frame do
  json.partial! "api/v1/frames/frame", frame: throw_object.frame
end

