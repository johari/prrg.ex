defmodule Prrg do

  defmacro prrg(expr, ret_val) do
    def_name = (elem expr, 0) |> atom_to_binary
    args = elem(expr, 2)
    arg_list = Enum.with_index(args) |>
               Enum.map(fn({_, y}) -> "arg#{y}" end) |>
               Enum.join ", "

    expanded_def = """
      def #{def_name}(#{arg_list}) do
        #{inspect ret_val}
      end
      """
    IO.write :stderr, expanded_def

    ret_val
  end

end
