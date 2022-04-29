defmodule Pastime.BaseballRepo.Migrations.CreateBattingView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW vw_batting AS
    SELECT p.name_first,
           p.name_last,
           b.person_id,
           b.year,
           b.stint,
           b.team_id,
           b.league_id,
           b.year - p.birth_year AS age,
           COALESCE(b.g, 0) AS g,
           (COALESCE(b.ab, 0) + COALESCE(b.bb, 0) + COALESCE(b.hbp, 0) + COALESCE(b.sh, 0) + COALESCE(b.sf, 0)) AS pa,
           COALESCE(b.ab, 0) AS ab,
           COALESCE(b.r, 0) AS r,
           COALESCE(b.h, 0) AS h,
           COALESCE(b."2b", 0) AS "2b",
           COALESCE(b."3b", 0) AS "3b",
           COALESCE(b.hr, 0) AS hr,
           COALESCE(b.rbi, 0) AS rbi,
           COALESCE(b.sb, 0) AS sb,
           COALESCE(b.cs, 0) AS cs,
           COALESCE(b.bb, 0) AS bb,
           COALESCE(b.so, 0) AS so,
           CASE
             WHEN b.ab IS NULL OR b.ab = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND(b.h::numeric / b.ab, 3)
           END AS ba,
           CASE
             WHEN b.ab IS NULL OR b.ab = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND((b.h + b.bb + COALESCE(b.hbp, 0))::numeric / (b.ab + b.bb + COALESCE(b.hbp, 0) + COALESCE(b.sf, 0)), 3)
           END AS obp,
           CASE
             WHEN b.ab IS NULL OR b.ab = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND(((b.h - b."2b" - b."3b" - b.hr + b."2b" * 2 + b."3b" * 3 + b.hr * 4) / b.ab::numeric), 3)
           END AS slg,
           CASE
             WHEN b.ab IS NULL OR b.ab = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND((b.h + b.bb + COALESCE(b.hbp, 0))::numeric / (b.ab + b.bb + COALESCE(b.hbp, 0) + COALESCE(b.sf, 0)) + ((b.h - b."2b" - b."3b" - b.hr + b."2b" * 2 + b."3b" * 3 + b.hr * 4) / b.ab::numeric), 3)
           END AS ops,
           (b.h - b."2b" - b."3b" - b.hr + b."2b" * 2 + b."3b" * 3 + b.hr * 4) AS tb,
           COALESCE(b.gidp, 0) AS gidp,
           COALESCE(b.hbp, 0) AS hbp,
           COALESCE(b.sh, 0) AS sh,
           COALESCE(b.sf, 0) AS sf,
           COALESCE(b.ibb, 0) AS ibb
      FROM batting b
      JOIN person p ON p.id = b.person_id
      JOIN team t ON t.id = b.team_id
    ;
    """
  end

  def down do
    execute "DROP VIEW vw_batting;"
  end

  def change do

  end
end
