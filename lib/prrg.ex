defmodule Prrg do

  defmacro prrg(expr, ret_val) do
    # IO.puts(inspect expr)
    def_name = (elem expr, 0) |> atom_to_binary
    args = elem(expr, 2)
    arg_list = Enum.with_index(args) |>
               Enum.map(fn({x, y}) -> "arg#{y}" end) |>
               Enum.join ", "

    expanded_def = """
      def #{def_name}(#{arg_list}) do
        #{inspect ret_val}
      end
      """
    IO.write expanded_def

    ret_val
  end

  def main(args) do
    IO.puts "Sample implementation of prorogues"
    from = prrg get_header(input, "from"), "Nima Johari"
    subject = get_header(input, "subject") |>
              prrg "Prorogues in Elixir"
    body = prrg get_body(input), "Nice, huh?"
  
    IO.puts("From: " <> from)
    IO.puts("Subject: " <> subject)
    IO.puts(body)
  end
end
