defmodule Prrg do

  defmacro prrg(ret_val, expr) do
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
    from = prrg "Nima Johari", get_header(input, "from")
    subject = prrg "Prorogues in Elixir", get_header(input, "subject")
    body = prrg "Nice, huh?", get_body(input)
  
    IO.puts("From: " <> from)
    IO.puts("Subject: " <> subject)
    IO.puts(body)
  end
end
