defmodule Pastime.BaseballRepo.Migrations.CreateFieldingView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW vw_fielding AS
    SELECT * FROM (
        SELECT p.name_first,
               p.name_last,
               f.person_id,
               f.year_id,
               f.stint,
               f.teamid,
               f.team_id,
               f.league_id,
               f.pos,
               f.g,
               f.gs,
               f.inn_outs,
               f.po,
               f.a,
               f.e,
               f.dp,
               f.pb,
               f.wp,
               f.sb,
               f.cs,
               f.zr
          FROM fielding f
          JOIN person p ON p.person_id = f.person_id

        UNION ALL

        SELECT p.name_first,
               p.name_last,
               fofs.person_id,
               fofs.year_id,
               fofs.stint,
               fofs.teamid,
               fofs.team_id,
               fofs.league_id,
               fofs.pos,
               fofs.g,
               fofs.gs,
               fofs.inn_outs,
               fofs.po,
               fofs.a,
               fofs.e,
               fofs.dp,
               fofs.pb,
               fofs.wp,
               fofs.sb,
               fofs.cs,
               fofs.zr
          FROM fielding_of_split fofs
          JOIN person p ON p.person_id = fofs.person_id

     UNION ALL

        SELECT p.name_first,
               p.name_last,
               fof.person_id,
               fof.year_id,
               fof.stint,
               NULL AS teamid,
               NULL AS team_id,
               NULL AS league_id,
               'LF' AS pos,
               fof.g_lf AS g,
               NULL AS gs,
               NULL AS inn_outs,
               NULL AS po,
               NULL AS a,
               NULL AS e,
               NULL AS dp,
               NULL AS pb,
               NULL AS wp,
               NULL AS sb,
               NULL AS cs,
               NULL AS zr
          FROM fielding_of fof
          JOIN person p ON p.person_id = fof.person_id
         WHERE fof.year_id < 1954

     UNION ALL

        SELECT p.name_first,
               p.name_last,
               fof.person_id,
               fof.year_id,
               fof.stint,
               NULL AS teamid,
               NULL AS team_id,
               NULL AS league_id,
               'CF' AS pos,
               fof.g_cf AS g,
               NULL AS gs,
               NULL AS inn_outs,
               NULL AS po,
               NULL AS a,
               NULL AS e,
               NULL AS dp,
               NULL AS pb,
               NULL AS wp,
               NULL AS sb,
               NULL AS cs,
               NULL AS zr
          FROM fielding_of fof
          JOIN person p ON p.person_id = fof.person_id
         WHERE fof.year_id < 1954

     UNION ALL

        SELECT p.name_first,
               p.name_last,
               fof.person_id,
               fof.year_id,
               fof.stint,
               NULL AS teamid,
               NULL AS team_id,
               NULL AS league_id,
               'RF' AS pos,
               fof.g_rf AS g,
               NULL AS gs,
               NULL AS inn_outs,
               NULL AS po,
               NULL AS a,
               NULL AS e,
               NULL AS dp,
               NULL AS pb,
               NULL AS wp,
               NULL AS sb,
               NULL AS cs,
               NULL AS zr
          FROM fielding_of fof
          JOIN person p ON p.person_id = fof.person_id
         WHERE fof.year_id < 1954
     ) AS f
      ORDER BY f.person_id, f.year_id, f.stint, f.team_id
    ;
    """
  end

  def down do
    execute "DROP VIEW vw_fielding;"
  end

  def change do

  end
end
