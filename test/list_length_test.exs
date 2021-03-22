defmodule IgniteChallenges.ListLengthTest do
  use ExUnit.Case

  alias IgniteChallenges.ListLength

  describe "call/1" do
    test "should return 0 if an empty list is provided" do
      response = ListLength.call([])
      expected_response = 0

      assert response === expected_response
    end

    test "should return 5 if a list with 5 items is provided" do
      response = ListLength.call([1, 2, 3, 4, 5])
      expected_response = 5

      assert response === expected_response
    end
  end
end
