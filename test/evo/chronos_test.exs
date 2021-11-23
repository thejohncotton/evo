defmodule EvoTest.ChronosTest do
  use ExUnit.Case, async: true

  alias Evo.World
  alias Evo.Chronos

  describe "record_world_history/1" do
    test "takes a world, copies current state into history under key from tick" do
      current_state = %{
        {0, 0} => %{soil_fertility: 10, entities: []},
        {0, 1} => %{soil_fertility: 8, entities: []}
      }

      world_to_update = %World{
        current_state: current_state,
        history: %{},
        tick: 0
      }

      actual = Chronos.record_world_history(world_to_update)

      expected = %World{
        current_state: current_state,
        history: %{0 => current_state},
        tick: 0
      }

      assert actual == expected
    end
  end

  describe "increment_time/1" do
    test "takes world and increments tick" do
      world_to_update = %World{
        current_state: %{},
        history: %{},
        tick: 0
      }

      actual = Chronos.increment_time(world_to_update)

      expected = %World{
        current_state: %{},
        history: %{},
        tick: 1
      }

      assert actual == expected
    end
  end
end
