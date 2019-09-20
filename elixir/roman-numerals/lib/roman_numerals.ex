defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @roman_nums [
    {"M", 1000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    meta_convert(@roman_nums, "", number);
  end

  defp meta_convert([], roman, 0), do: roman
 
  defp meta_convert([h|t], roman, number) when number >= elem(h, 1) do
    meta_convert([h|t], roman <> elem(h, 0), number - elem(h, 1))
  end

  defp meta_convert([_h|t], roman, number) do
    meta_convert(t, roman, number)
  end
end
