defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/\w+/, string)
    |> List.flatten
    |> Enum.map(&(Regex.scan(~r/\p{Lu}|^\p{Ll}/, &1)))
    |> List.flatten
    |> Enum.join
    |> String.upcase
  end
end
