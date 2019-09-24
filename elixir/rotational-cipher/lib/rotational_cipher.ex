defmodule RotationalCipher do
  @alphabet ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  # @alphabet_caps ~w(A B C D E F G)
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.
  
  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    # TODO STREAM.cycle
    String.downcase(text)
    |> String.split()
    |> Enum.map(fn char -> rotate_one(char, shift) end)
    |> Enum.join()
  end

  def rotate_one(char, shift) do
    index = Enum.find_index(@alphabet, fn x -> x === char end)
  
     Enum.at(@alphabet, wrap_around(index, shift))
  end

  defp wrap_around(index, 0) do
    index
  end

  defp wrap_around(index, shift) do
    max_value = length(@alphabet)
    new_index = if(index + 1 === max_value, do: 0, else: index + 1)
    wrap_around(new_index, shift - 1)
  end
end
