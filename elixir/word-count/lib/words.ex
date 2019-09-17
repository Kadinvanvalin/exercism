defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    split = String.split(sentence, ~r"[^a-zA-Z0-9äöüÄÖÜß-]", trim: true)
    start_counting(%{}, split)
  end

  defp start_counting(map, [head | []]) do
    update_map(map, head)
  end

  defp start_counting(map, [head | tail]) do
    update_map(map, head)
    |> start_counting(tail)
  end

  defp update_map(map, head) do
    Map.update(map, String.downcase(head), 1, &(&1 + 1))
  end
end
