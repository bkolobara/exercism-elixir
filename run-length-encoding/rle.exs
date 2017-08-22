defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    # Break down string into repeated letter groups with backreferenc (\1) regex
    Regex.scan(~r/([a-zA-Z ])\1*/, string)
    |> Enum.map(fn
        [letter_group, letter] when byte_size(letter_group) == 1 -> letter
        [letter_group, letter] ->
          count = letter_group
                    |> String.length
                    |> Integer.to_string
          count <> letter 
       end)
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    # Grup (digits before letter and letter) or only letter
    Regex.scan(~r/(\d+)([a-zA-Z ])|[a-zA-Z ]/, string)
    |> Enum.map(fn
         [letter] -> letter
         [_encoded_letter_group, multiplier, letter] ->
           String.duplicate(letter, String.to_integer(multiplier))
         end)
    |> Enum.join
  end
end
