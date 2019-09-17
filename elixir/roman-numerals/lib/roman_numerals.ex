defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    convert("", number)
  end
  # romanNums = %{
  #   "X": 10,

  # }

  def convert(roman, number) when number >= 10 do
    (roman <> "X")
    |> convert(number - 10)
  end

  def convert(roman, number) when number >= 5  do
    (roman <> "V")
    |> convert(number - 5)
  end
  
  def convert(roman, number) when number >= 4 do
    (roman <> "IV")
    |> convert(number - 4)
  end

  def convert(roman, number) when number > 0 do
    (roman <> "I")
    |> convert(number - 1)
  end

  def convert(roman, 0) do
    roman
  end
end
