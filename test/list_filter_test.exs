defmodule IgniteChallenges.ListFilterTest do
  use ExUnit.Case
  alias IgniteChallenges.ListFilter

  describe "call/1" do
    test "should return count correctly if a valid list is provided" do
      data = ["1", "3", "6", "43", "banana", "6", "abc"]

      response = ListFilter.call(data)

      expected_response = 3

      assert response == expected_response
    end

    test "should return count 0 if a list with integeter no has provided" do
      data = ["banana", "abc"]

      response = ListFilter.call(data)

      expected_response = 0

      assert response == expected_response
    end

    test "should return count 0 if a list with only evens is provided" do
      data = ["2", "4", "6"]

      response = ListFilter.call(data)

      expected_response = 0

      assert response == expected_response
    end

    test "should return count 0 if an empty list is provided" do
      data = []

      response = ListFilter.call(data)

      expected_response = 0

      assert response == expected_response
    end
  end
end
