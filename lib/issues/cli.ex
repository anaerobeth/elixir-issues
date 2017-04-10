defmodule Issues.CLI do

  @default_count 4

  @moduledoc """
  Command line parsing for last _n_issues
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  { user project, count }
  """

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean],
      aliases: [h: :help])

    case parse do
      { [ help: true ], _, _ }
        -> :help
      { _, [ user, project, count ], _ }
        -> { user, project, String.to_integer(count) }
      { _, [ user, project ], _ }
        -> { user, project, @default_count }
      _ -> :help
    end
  end
end
