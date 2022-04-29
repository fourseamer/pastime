defmodule PastimeWeb.TeamView do
  use PastimeWeb, :view

  def primary_position(appearances) do
    positions = [
      {0, 0},
      {appearances.g_p, "P"},
      {appearances.g_c, "C"},
      {appearances.g_1b, "1B"},
      {appearances.g_2b, "2B"},
      {appearances.g_3b, "3B"},
      {appearances.g_ss, "SS"},
      {appearances.g_lf, "LF"},
      {appearances.g_cf, "CF"},
      {appearances.g_rf, "RF"},
    ]
    |> Enum.max_by(fn {x, i} -> x end)

    elem(positions, 1)
  end
end
