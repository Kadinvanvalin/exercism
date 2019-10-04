defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      not valid_direction?(direction) ->
        {:error, "invalid direction"}
      not valid_position?(position) ->
        {:error, "invalid position"}
      true ->
         %{
           position: position,
           direction: direction
         }
    end
  end

  defp valid_direction?(:north), do: true
  defp valid_direction?(:east), do: true
  defp valid_direction?(:south), do: true
  defp valid_direction?(:west), do: true
  defp valid_direction?(invalid_direction), do: false

  defp valid_position?({a, b}), do: is_integer(a) and is_integer(b)
  defp valid_position?(any), do: false

  def simulate(robot, "") do
    robot
  end
  def simulate(robot, "R") do
    poles = [:north, :east, :south, :west]
    index = Enum.find_index(poles, fn x -> x == direction(robot) end)
    position = Enum.at(poles, index + 1)
    %{
        position: position,
        direction: direction(robot)
      }
  end
  def simulate(robot, "L") do
    poles = [:north, :east, :south, :west]
    index = Enum.find_index(poles, fn x -> x == direction(robot) end)
    position = Enum.at(poles, index - 1)
    %{
        position: position,
        direction: direction(robot)
      }
  end
  def simulate(robot, "A") do
  direction = direction(robot)
  poles = [north: {1, 0}, east: {0, 1}, south: {-1, 0}, west: {0, -1}]
  position = { 
    position(robot)[0] + elem(poles[direction], 0) ,  position(robot)[1]  + elem(poles[direction], 1) 
  }
    robot
      %{
        position: position,
        direction: direction
      }
  end
  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.split("")
    |> Enum.reduce(robot, fn x, acc -> simulate(acc, x) end)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    Map.get(robot, :direction)
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    Map.get(robot, :position)
  end
end
