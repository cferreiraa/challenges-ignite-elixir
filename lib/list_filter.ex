defmodule IgniteChallenges.ListFilter do
  require Integer
  alias IgniteChallenges.ListLength

  def call(list) do
    list
    |> Enum.filter(&filter_list/1)
    |> ListLength.call()
  end

  defp filter_list(value) do
    case Integer.parse(value) do
      :error -> false
      {int, _decimal} -> rem(int, 2) != 0
    end
  end
end
