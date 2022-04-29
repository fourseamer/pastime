defmodule Pastime.BaseballRepo.Migrations.CreateFieldingView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW vw_fielding AS
    SELECT * FROM (
        SELECT p.name_first,
               p.name_last,
               f.person_id,
               f.year,
               f.stint,
               f.team_id,
               f.league_id,
               f.pos,
               COALESCE(f.g, 0) AS g,
               COALESCE(f.gs, 0) AS gs,
               COALESCE(f.inn_outs, 0) AS inn_outs,
               COALESCE(f.po, 0) AS po,
               COALESCE(f.a, 0) AS a,
               COALESCE(f.e, 0) AS e,
               COALESCE(f.dp, 0) AS dp,
               COALESCE(f.pb, 0) AS pb,
               COALESCE(f.wp, 0) AS wp,
               COALESCE(f.sb, 0) AS sb,
               COALESCE(f.cs, 0) AS cs,
               COALESCE(f.zr, 0) AS zr
          FROM fielding f
          JOIN person p ON p.id = f.person_id
         WHERE f.pos <> 'OF'

        UNION ALL

        SELECT p.name_first,
               p.name_last,
               fofs.person_id,
               fofs.year,
               fofs.stint,
               fofs.team_id,
               fofs.league_id,
               fofs.pos,
               COALESCE(fofs.g, 0) AS g,
               COALESCE(fofs.gs, 0) AS gs,
               COALESCE(fofs.inn_outs, 0) AS inn_outs,
               COALESCE(fofs.po, 0) AS po,
               COALESCE(fofs.a, 0) AS a,
               COALESCE(fofs.e, 0) AS e,
               COALESCE(fofs.dp, 0) AS dp,
               COALESCE(fofs.pb, 0) AS pb,
               COALESCE(fofs.wp, 0) AS wp,
               COALESCE(fofs.sb, 0) AS sb,
               COALESCE(fofs.cs, 0) AS cs,
               COALESCE(fofs.zr, 0) AS zr
          FROM fielding_of_split fofs
          JOIN person p ON p.id = fofs.person_id

     UNION ALL

        SELECT p.name_first,
               p.name_last,
               fof.person_id,
               fof.year,
               fof.stint,
               f.team_id,
               f.league_id,
               'LF' AS pos,
               COALESCE(fof.g_lf, 0) AS g,
               0 AS gs,
               0 AS inn_outs,
               0 AS po,
               0 AS a,
               0 AS e,
               0 AS dp,
               0 AS pb,
               0 AS wp,
               0 AS sb,
               0 AS cs,
               0 AS zr
          FROM fielding_of fof
          JOIN person p ON p.id = fof.person_id
          JOIN fielding f ON f.person_id = p.id
               AND f.year = fof.year
               AND f.stint = fof.stint
               AND f.pos = 'OF'
         WHERE fof.year < 1954
           AND fof.g_lf > 0

     UNION ALL

        SELECT p.name_first,
               p.name_last,
               fof.person_id,
               fof.year,
               fof.stint,
               f.team_id,
               f.league_id,
               'CF' AS pos,
               COALESCE(fof.g_cf, 0) AS g,
               0 AS gs,
               0 AS inn_outs,
               0 AS po,
               0 AS a,
               0 AS e,
               0 AS dp,
               0 AS pb,
               0 AS wp,
               0 AS sb,
               0 AS cs,
               0 AS zr
          FROM fielding_of fof
          JOIN person p ON p.id = fof.person_id
          JOIN fielding f ON f.person_id = p.id
               AND f.year = fof.year
               AND f.stint = fof.stint
               AND f.pos = 'OF'
         WHERE fof.year < 1954
           AND fof.g_cf > 0

     UNION ALL

        SELECT p.name_first,
               p.name_last,
               fof.person_id,
               fof.year,
               fof.stint,
               f.team_id,
               f.league_id,
               'RF' AS pos,
               COALESCE(fof.g_rf, 0) AS g,
               0 AS gs,
               0 AS inn_outs,
               0 AS po,
               0 AS a,
               0 AS e,
               0 AS dp,
               0 AS pb,
               0 AS wp,
               0 AS sb,
               0 AS cs,
               0 AS zr
          FROM fielding_of fof
          JOIN person p ON p.id = fof.person_id
          JOIN fielding f ON f.person_id = p.id
               AND f.year = fof.year
               AND f.stint = fof.stint
               AND f.pos = 'OF'
         WHERE fof.year < 1954
           AND fof.g_rf > 0
     ) AS f
      ORDER BY f.person_id, f.year, f.stint, f.team_id
    ;
    """
  end

  def down do
    execute "DROP VIEW vw_fielding;"
  end

  def change do

  end
end
