defmodule Pastime.BaseballRepo.Migrations.CreateManagerView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW vw_manager AS
      SELECT DISTINCT ON (p.name_last, p.name_first)
             p.id AS person_id,
             p.name_first,
             p.name_last,
             COUNT(m.id) AS yrs,
             MIN(m.year) AS "from",
             MAX(m.year) AS "to",
             SUM(m.w) AS w,
             SUM(m.l) AS l,
             ROUND(SUM(m.w)::numeric / (SUM(m.w) + SUM(m.l)), 3) AS pct,
             SUM(m.w) + SUM(m.l) AS g,
             MIN(m.rank) AS best_finish,
             MAX(m.rank) AS worst_finish,
             ROUND(AVG(m.rank), 1) AS avg_finish
        FROM person p
        JOIN manager m ON m.person_id = p.id
    GROUP BY p.id
    ORDER BY p.name_last, p.name_first
    ;
    """
  end

  def down do
    execute "DROP VIEW vw_manager;"
  end

  def change do

  end
end
