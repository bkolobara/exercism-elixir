defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(&(encode(&1, shift)))
    |> to_string
  end

  def encode(char, shift) when char >= ?a and char <= ?z do
    rem(char - ?a + shift, 26) + ?a
  end
  def encode(char, shift) when char >= ?A and char <= ?Z do
    rem((char - ?A + shift), 26) + ?A
  end
  def encode(char, _shift), do: char
end

