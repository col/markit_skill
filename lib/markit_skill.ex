defmodule MarkitSkill do
  use Alexa.Skill, app_id: "amzn1.echo-sdk-ams.app.313029af-27c6-47dd-bccc-8b0b1a888e0c"
  import Inflex

  def handle_intent("Lookup", request, response) do
    search_term = slot_value(request, "term")
    results = Markit.lookup(search_term)
    num_results = Enum.count(results)
    say_results = Enum.reduce(results, "", fn(result, acc) ->
      acc <> " The symbol for #{result.name} is <say-as interpret-as=\"spell-out\">#{result.symbol}</say-as>."
    end)
    response
    |> say_ssml("<speak>I found #{num_results} #{Inflex.inflect("result", num_results)}." <> say_results <> "</speak>")
  end

  def handle_intent("Quote", request, response) do
    response
    |> say("Lookup is not yet supported. Please try again tomorrow.")
  end

end
