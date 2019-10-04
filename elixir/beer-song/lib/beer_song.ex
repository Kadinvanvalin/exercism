defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &verse/1)
  end

  def verse(number) do
    """
    #{number |> bottleCount() |> String.capitalize()} of beer on the wall, #{bottleCount(number)} of beer.
    #{callToAction(number)}, #{bottleCount(number - 1)} of beer on the wall.
    """
  end

  defp callToAction(0) do
    "Go to the store and buy some more"
  end

  defp callToAction(1) do
    "Take it down and pass it around"
  end

  defp callToAction(_) do
    "Take one down and pass it around"
  end

  defp bottleCount(0) do
    "no more bottles"
  end

  defp bottleCount(1) do
    "1 bottle"
  end

  defp bottleCount(-1) do
    "99 bottles"
  end

  defp bottleCount(number) do
    "#{number} bottles"
  end
end
