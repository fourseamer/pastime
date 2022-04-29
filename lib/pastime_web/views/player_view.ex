defmodule PastimeWeb.PlayerView do
  use PastimeWeb, :view

  def ordered_appearances(appearances, g_team) do
    positions = [
      {0, 0},
      {appearances.g_p, "1"},
      {appearances.g_c, "2"},
      {appearances.g_1b, "3"},
      {appearances.g_2b, "4"},
      {appearances.g_3b, "5"},
      {appearances.g_ss, "6"},
      {appearances.g_lf, "7"},
      {appearances.g_cf, "8"},
      {appearances.g_rf, "9"},
      {appearances.g_ph + appearances.g_pr, "H"},
      {appearances.g_dh, "D"}
    ]
    |> Enum.reject(fn {x, _y} -> x == 0 end)
    |> Enum.sort_by(fn {x, _y} -> x end, :desc)

    positions = delimit_at_index(positions, get_splat_index(positions, g_team), "*")
    positions = delimit_at_index(positions, get_slash_index(positions), "/")
    positions
    |> Enum.map(fn {_x, y} -> y end)
    |> Enum.join("")
  end

  defp delimit_at_index(positions, index, char) do
    if is_nil(index) do
      positions
    else
      List.insert_at(positions, index, {:char, char})
    end
  end

  defp get_splat_index(positions, g_team) do
    Enum.find_index(positions, fn {x, _y} -> (x / g_team) > 0.666 end)
  end

  defp get_slash_index(positions) do
    Enum.find_index(positions, fn {x, _y} -> x < 10 end)
  end
end
