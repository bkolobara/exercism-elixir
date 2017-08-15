defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
      |> String.split(~r/[_\s]+/)
      |> Enum.reduce(%{}, fn (element, result) ->
           element_trimmed = element |> String.replace(~r/[&@:\,\.\!\$\%\^]/, "") |> String.downcase
           Map.update(result, element_trimmed, 1, &(&1 + 1))
         end)
      |> Map.delete("")
  end
end
