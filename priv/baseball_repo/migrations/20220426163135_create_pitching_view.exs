defmodule Pastime.BaseballRepo.Migrations.CreatePitchingView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW vw_pitching AS
    SELECT p.name_first,
           p.name_last,
           pi.person_id,
           pi.year,
           pi.stint,
           pi.team_id,
           pi.league_id,
           pi.year - p.birth_year AS age,
           COALESCE(pi.w, 0) AS w,
           COALESCE(pi.l, 0) AS l,
           COALESCE(pi.era::numeric, 0) AS era,
           COALESCE(pi.g, 0) AS g,
           COALESCE(pi.gs, 0) AS gs,
           COALESCE(pi.gf, 0) AS gf,
           COALESCE(pi.cg, 0) AS cg,
           COALESCE(pi.sho, 0) AS sho,
           COALESCE(pi.sv, 0) AS sv,
           COALESCE(pi.ip_outs, 0) AS ip_outs,
           CASE
             WHEN pi.ip_outs IS NULL OR pi.ip_outs = 0
             THEN ROUND(0::numeric, 1)
             ELSE ROUND(pi.ip_outs::numeric / 3, 1)
           END AS ip,
           COALESCE(pi.h, 0) AS h,
           COALESCE(pi.r, 0) AS r,
           COALESCE(pi.er, 0) AS er,
           COALESCE(pi.hr, 0) AS hr,
           COALESCE(pi.bb, 0) AS bb,
           COALESCE(pi.ibb, 0) AS ibb,
           COALESCE(pi.so, 0) AS so,
           COALESCE(pi.hbp, 0) AS hbp,
           COALESCE(pi.bk, 0) AS bk,
           COALESCE(pi.wp, 0) AS wp,
           COALESCE(pi.bfp, 0) AS bfp,
           COALESCE(pi.sh, 0) AS sh,
           COALESCE(pi.sf, 0) AS sf,
           COALESCE(pi.gidp, 0) AS gidp,
           COALESCE(pi.ba_opp, 0) AS ba_opp,
           CASE
             WHEN pi.ip_outs IS NULL OR pi.ip_outs = 0
             THEN ROUND(0::numeric, 2)
             ELSE ROUND((pi.h::numeric + pi.bb) / (pi.ip_outs::numeric / 3), 2)
           END AS whip,
           CASE
             WHEN pi.ip_outs IS NULL OR pi.ip_outs = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND((pi.h::numeric * 9) / (pi.ip_outs::numeric / 3), 2)
           END AS h9,
           CASE
             WHEN pi.ip_outs IS NULL OR pi.ip_outs = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND((pi.hr::numeric * 9) / (pi.ip_outs::numeric / 3), 2)
           END AS hr9,
           CASE
             WHEN pi.ip_outs IS NULL OR pi.ip_outs = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND((pi.bb::numeric * 9) / (pi.ip_outs::numeric / 3), 2)
           END AS bb9,
           CASE
             WHEN pi.ip_outs IS NULL OR pi.ip_outs = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND((pi.so::numeric * 9) / (pi.ip_outs::numeric / 3), 2)
           END AS so9,
           CASE
             WHEN pi.bb IS NULL OR pi.bb = 0
             THEN ROUND(0::numeric, 3)
             ELSE ROUND(pi.so::numeric / pi.bb, 2)
           END AS "so/w"
      FROM pitching pi
      JOIN person p ON p.id = pi.person_id
      JOIN team t ON t.id = pi.team_id
    ;
    """
  end

  def down do
    execute "DROP VIEW vw_pitching;"
  end

  def change do

  end
end
