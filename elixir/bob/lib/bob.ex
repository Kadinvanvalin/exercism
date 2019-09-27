defmodule Bob do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") && String.upcase(input) === input &&
          String.upcase(input) != String.downcase(input) ->
        "Calm down, I know what I'm doing!"

      String.ends_with?(input, "?") ->
        "Sure."

      input |> String.trim(" ") |> String.length() === 0 ->
        "Fine. Be that way!"

      String.upcase(input) === input && String.upcase(input) != String.downcase(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end
end
