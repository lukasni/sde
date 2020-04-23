defmodule SDE do
  @moduledoc """
  Documentation for `SDE`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SDE.hello()
      :world

  """
  def hello do
    :world
  end

  def populate() do
    SDE.Config.yaml_files()
    |> Enum.map(&SDE.Loader.load/1)
  end

  def precompile() do
    SDE.Config.yaml_files()
    |> SDE.Converter.yaml_to_etf()
  end
end
