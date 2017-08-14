defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      # Match at least one letter but not a lowercase one.
      input =~ ~r/[\p{L}]/u and
        not (input =~ ~r/[\p{Ll}]/u) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
