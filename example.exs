import Prrg

IO.puts "Sample implementation of prorogues"

# prrg f(x), "return value"
from = prrg get_header(input, "from"), "Nima Johari"

# this works as well
# f(x) |> prrg "ret value"
subject = get_header(input, "subject") |>
          prrg "Prorogues in Elixir"

# or put the optional parenthesis as well
body = prrg(get_body(input), "Nice, huh?")

IO.puts("From: " <> from)
IO.puts("Subject: " <> subject)
IO.puts(body)
