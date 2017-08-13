defmodule PigLatin do

  @spec to_pig_latin(word :: String.t()) :: String.t()
  defp to_pig_latin(word) do
    if String.starts_with?(word, ["a", "e", "i", "o", "u", "yt", "xr"]) do
      word <> "ay"
    else
      case word do
        "ch" <> rest -> rest <> "chay"
        "qu" <> rest -> rest <> "quay"
        "squ" <> rest -> rest <> "squay"
        "thr" <> rest -> rest <> "thray"
        "th" <> rest -> rest <> "thay"
        "sch" <> rest -> rest <> "schay"
        << first :: utf8, rest :: bitstring >> ->
          <<rest::bitstring, first::utf8, "ay">>
      end
    end
  end

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
      |> String.split
      |> Enum.map(&to_pig_latin/1)
      |> Enum.join(" ")
  end
end

