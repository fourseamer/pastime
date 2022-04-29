defmodule Pastime.BaseballRepo.Migrations.CreateFranchiseView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW vw_franchise AS
      SELECT f.id,
             f.name,
             f.is_active,
             MIN(t.year) AS from,
             MAX(t.year) AS to,
             SUM(t.g) AS g,
             SUM(t.w) AS w,
             SUM(t.l) AS l,
             ROUND((SUM(t.w)::numeric / SUM(t.g)), 3) AS pct,
             (COUNT(1) FILTER (WHERE t.division_win)) AS division_wins,
             (COUNT(1) FILTER (WHERE t.league_win)) AS league_wins,
             (COUNT(1) FILTER (WHERE t.world_series_win)) AS world_series_wins
        FROM franchise f
        JOIN team t ON t.franchise_id = f.id
    GROUP BY f.id
    ORDER BY f.is_active DESC, f.name
    ;
    """
  end

  def down do
    execute "DROP VIEW vw_franchise;"
  end

  def change do

  end
end
