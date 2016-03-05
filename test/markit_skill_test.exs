defmodule MarkitSkillTest do
  use ExUnit.Case
  doctest MarkitSkill

  test "Lookup 'Tesla'" do
    {:ok, content} = File.read("test/data/lookup_request.json")
    request = Poison.decode!(content, as: %Alexa.Request{})
    response = Alexa.handle_request(request)
    assert "<speak>I found 1 result. The symbol for Tesla Motors Inc is <say-as interpret-as=\"spell-out\">TSLA</say-as>.</speak>"
     = Alexa.Response.say_ssml(response)
  end
end
