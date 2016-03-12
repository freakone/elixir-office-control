defmodule OfficeElixir.Relay do

  def logger(num) do
    IO.puts |> "yeah" |> num+1
    :timer.sleep(1000)
    logger(num)
  end

  logger(0)
end
