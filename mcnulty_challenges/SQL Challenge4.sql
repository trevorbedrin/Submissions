(select 		player,
			sum(wins) as wins,
			sum(unforced_errors) / sum(points_lost) as unforced_error_pct,
			'men' as gender

from (
			select 		player1 as player, 
						case
							when result=1
							then 1
							else 0
						end as wins,
						ufe_1 as unforced_errors,
						tpw_2 as points_lost
			
			from(
 						select 		*
 						from 		us_men_2013
			 		union 
			 			select 		*
			 			from 		us_men_2013
			 		union 
			 			select 		*
			 			from 		fra_men_2013
			 		union 
			 			select 		*
			 			from 		fra_men_2013
			 		union 
			 			select 		*
			 			from 		wim_men_2013
			 		union 
			 			select 		*
			 			from 		wim_men_2013
			 		union 
			 			select 		*
			 			from 		aus_men_2013
			 		union 
			 			select 		*
			 			from 		aus_men_2013
			 ) all_men_data
 
			 union
 
			 select 	player2 as player, 
						case
							when result=0
							then 1
							else 0
						end as wins,
						ufe_2 as unforced_errors,
						tpw_1 as points_lost			
			from(
			 			select 		*
			 			from 		us_men_2013
			 		union 
			 			select 		*
			 			from 		us_men_2013
			 		union 
			 			select 		*
			 			from 		fra_men_2013
			 		union 
			 			select 		*
			 			from 		fra_men_2013
			 		union 
			 			select 		*
			 			from 		wim_men_2013
			 		union 
			 			select 		*
			 			from 		wim_men_2013
			 		union 
			 			select 		*
			 			from 		aus_men_2013
			 		union 
			 			select 		*
 						from 		aus_men_2013
 			) all_men_data
) final_men_table

group by 	player
order by 	wins desc
limit 		3)

union

(select 		player,
			sum(wins) as wins,
			sum(unforced_errors) / sum(points_lost) as unforced_error_pct,
			'women' as gender

from (
			select 		player1 as player, 
						case
							when result=1
							then 1
							else 0
						end as wins,
						ufe_1 as unforced_errors,
						tpw_2 as points_lost
			
			from(
 						select 		*
 						from 		us_women_2013
			 		union 
			 			select 		*
			 			from 		us_women_2013
			 		union 
			 			select 		*
			 			from 		fra_women_2013
			 		union 
			 			select 		*
			 			from 		fra_women_2013
			 		union 
			 			select 		*
			 			from 		wim_women_2013
			 		union 
			 			select 		*
			 			from 		wim_women_2013
			 		union 
			 			select 		*
			 			from 		aus_women_2013
			 		union 
			 			select 		*
			 			from 		aus_women_2013
			 ) all_women_data
 
			 union
 
			 select 	player2 as player, 
						case
							when result=0
							then 1
							else 0
						end as wins,
						ufe_2 as unforced_errors,
						tpw_1 as points_lost			
			from(
			 			select 		*
			 			from 		us_women_2013
			 		union 
			 			select 		*
			 			from 		us_women_2013
			 		union 
			 			select 		*
			 			from 		fra_women_2013
			 		union 
			 			select 		*
			 			from 		fra_women_2013
			 		union 
			 			select 		*
			 			from 		wim_women_2013
			 		union 
			 			select 		*
			 			from 		wim_women_2013
			 		union 
			 			select 		*
			 			from 		aus_women_2013
			 		union 
			 			select 		*
 						from 		aus_women_2013
 			) all_women_data
) final_women_table

group by 	player
order by 	wins desc
limit 		3);
 
 