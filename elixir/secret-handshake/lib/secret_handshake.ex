defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    # code = <<code::8>>
    code = [9] ++ Integer.to_charlist(code, 2)
    # IO.puts(code)
    list = []

    list ++ code(code)
  end

  def code([head | list]) do
    case list do
      '1' ->
        ["wink"]

      '10'<<>> ->
        ["double blink"]

      '100' ->
        ["close your eyes"]

      '1000' ->
        ["jump"]
    end
  end
end
