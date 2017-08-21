defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when byte_size(s) < size or size < 1 do
    []
  end
  def slices(s, size) do
    for i <- 0..(String.length(s)-size) do
      String.slice(s, i..(i-1+size))
    end
  end
end

