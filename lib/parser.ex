defmodule IgniteChallenges.ParserReport do
  def parser_file(filename) do
    "reports/#{filename}.csv"
    |> File.stream!()
    |> Stream.map(fn line -> parser_line(line) end)
  end

  defp parser_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(3, &get_month/1)
  end

  defp get_month(month) do
    month_list = month_list(%{})
    month_list
    |> Map.get(month)
  end

  defp month_list(_name) do
    %{}
    |> Map.put("1", "janeiro")
    |> Map.put("2", "fevereiro")
    |> Map.put("3", "marco")
    |> Map.put("4", "abril")
    |> Map.put("5", "maio")
    |> Map.put("6", "junho")
    |> Map.put("7", "julho")
    |> Map.put("8", "agosto")
    |> Map.put("9", "setembro")
    |> Map.put("10", "outubro")
    |> Map.put("11", "novembro")
    |> Map.put("12", "dezembro")
  end
end
