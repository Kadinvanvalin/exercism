defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/[A-Z]\?/) -> "Calm down, I know what I'm doing!"
      String.match?(input, ~r/\?$/) -> "Sure."
      String.length(String.trim(input)) === 0 -> "Fine. Be that way!"
      String.match?(input, ~r/[[:upper:]][[:upper:]]/u) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
