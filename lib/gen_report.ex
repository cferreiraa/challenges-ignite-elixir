defmodule IgniteChallenges.GenReport do
  alias IgniteChallenges.ParserReport

  def call(filename) do
    filename
    |> ParserReport.parser_file()
    |> Enum.reduce(pattern_report(%{}), &update_report(&1, &2))
  end

  def pattern_report(report) do
    report
    |> Map.put("all_hours", %{})
    |> Map.put("hours_per_month", %{})
    |> Map.put("hours_per_year", %{})
  end

  defp update_report(line, report) do
    with %{} = all_hours <- update_all_hours(line, report),
         %{} = hours_per_year <- update_hours_per_year(line, report) do
      report
      |> Map.put("all_hours", all_hours)
      |> Map.put("hours_per_year", hours_per_year)
    end
  end

  defp update_all_hours([name, hours, _day, _month, _year], report) do
    with %{} = map <- Map.get(report, "all_hours") do
      map
      |> sum_value(name, hours)
    end
  end

  defp update_hours_per_year([name, hours, _day, _month, year], report) do
    with %{} = hourse_per_year <- Map.get(report, "hours_per_year") do
      hourse_per_year
      |> update_hours_per_year(year, name, hours)
    end
  end

  defp update_hours_per_year(target, key, name, hours) do
    value_default = Map.put(%{}, name, hours)

    case Map.get(target, key) do
      nil -> Map.put(target, key, value_default)
      result -> target |> Map.put(key, sum_value(result, name, hours))
    end
  end

  defp sum_value(target, key, hours) do
    case Map.get(target, key) do
      nil -> Map.put(target, key, hours)
      total -> Map.put(target, key, total + hours)
    end
  end
end
