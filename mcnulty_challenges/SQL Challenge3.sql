select 		distinct all_match_data.player,
			all_match_data.gender,
			greatest(ifnull(all_match_data.us_open,0),ifnull(all_match_data.french_open,0),ifnull(all_match_data.australian_open,0),ifnull(all_match_data.wimbledon,0)) as best_fsp
from (

select 		all_players.player,
			A.first_serve_pct as us_open,
			B.first_serve_pct as french_open,
			C.first_serve_pct as wimbledon,
			D.first_serve_pct as australian_open,
			'men' as gender

from (
	select distinct player
	from(
 			select 		distinct player1 as player
 			from 		us_men_2013
 		union 
 			select 		distinct player2  as player
 			from 		us_men_2013
 		union 
 			select 		distinct player1 as player
 			from 		fra_men_2013
 		union 
 			select 		distinct player2  as player
 			from 		fra_men_2013
 		union 
 			select 		distinct player1  as player
 			from 		wim_men_2013
 		union 
 			select 		distinct player2  as player
 			from 		wim_men_2013
 		union 
 			select 		distinct player1  as player
 			from 		aus_men_2013
 		union 
 			select 		distinct player2  as player
 			from 		aus_men_2013
 	) player_list
) all_players


left outer join(
			select 		total_us_men_table.player, 
						greatest(ifnull(total_us_men_table.first_serve_pct_1,0),ifnull(total_us_men_table.first_serve_pct_2,0)) as first_serve_pct
						
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		us_men_2013 
								union 
									select 		distinct player2 as player 
									from 		us_men_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1
									from 		us_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		us_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_us_men_table
) A on all_players.player = A.player

left outer join (
			select 		total_fra_men_table.player, 
						greatest(ifnull(total_fra_men_table.first_serve_pct_1,0),ifnull(total_fra_men_table.first_serve_pct_2,0)) as first_serve_pct
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		fra_men_2013 
								union 
									select 		distinct player2 as player 
									from 		fra_men_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1
									from 		fra_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		fra_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_fra_men_table
) B on all_players.player = B.player
left outer join (
			select 		total_wim_men_table.player, 
						greatest(ifnull(total_wim_men_table.first_serve_pct_1,0),ifnull(total_wim_men_table.first_serve_pct_2,0)) as first_serve_pct
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		wim_men_2013 
								union 
									select 		distinct player2 as player 
									from 		wim_men_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1 
									from 		wim_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		wim_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_wim_men_table
) C on all_players.player = C.player
left outer join (
			select 		total_aus_men_table.player, 
						greatest(ifnull(total_aus_men_table.first_serve_pct_1,0),ifnull(total_aus_men_table.first_serve_pct_2,0)) as first_serve_pct
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		aus_men_2013 
								union 
									select 		distinct player2 as player 
									from 		aus_men_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1 
									from 		aus_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		aus_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_aus_men_table
) D on all_players.player = D.player

union 

select 		all_players.player,
			A.first_serve_pct as us_open,
			B.first_serve_pct as french_open,
			C.first_serve_pct as wimbledon,
			D.first_serve_pct as australian_open,
			'women' as gender

from (
	select distinct player
	from(
 			select 		distinct player1 as player
 			from 		us_women_2013
 		union 
 			select 		distinct player2  as player
 			from 		us_women_2013
 		union 
 			select 		distinct player1 as player
 			from 		fra_women_2013
 		union 
 			select 		distinct player2  as player
 			from 		fra_women_2013
 		union 
 			select 		distinct player1  as player
 			from 		wim_women_2013
 		union 
 			select 		distinct player2  as player
 			from 		wim_women_2013
 		union 
 			select 		distinct player1  as player
 			from 		aus_women_2013
 		union 
 			select 		distinct player2  as player
 			from 		aus_women_2013
 	) player_list
) all_players


left outer join(
			select 		total_us_women_table.player, 
						greatest(ifnull(total_us_women_table.first_serve_pct_1,0),ifnull(total_us_women_table.first_serve_pct_2,0)) as first_serve_pct
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		us_women_2013 
								union 
									select 		distinct player2 as player 
									from 		us_women_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1
									from 		us_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		us_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_us_women_table
) A on all_players.player = A.player

left outer join (
			select 		total_fra_women_table.player, 
						greatest(ifnull(total_fra_women_table.first_serve_pct_1,0),ifnull(total_fra_women_table.first_serve_pct_2,0)) as first_serve_pct
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		fra_women_2013 
								union 
									select 		distinct player2 as player 
									from 		fra_women_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1 
									from 		fra_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		fra_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_fra_women_table
) B on all_players.player = B.player
left outer join (
			select 		total_wim_women_table.player, 
						greatest(ifnull(total_wim_women_table.first_serve_pct_1,0),ifnull(total_wim_women_table.first_serve_pct_2,0)) as first_serve_pct
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		wim_women_2013 
								union 
									select 		distinct player2 as player 
									from 		wim_women_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1 
									from 		wim_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		wim_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_wim_women_table
) C on all_players.player = C.player
left outer join (
			select 		total_aus_women_table.player, 
						greatest(ifnull(total_aus_women_table.first_serve_pct_1,0),ifnull(total_aus_women_table.first_serve_pct_2,0)) as first_serve_pct
			from (
						select 		* 
						from (
									select 		distinct player1 as player 
									from 		aus_women_2013 
								union 
									select 		distinct player2 as player 
									from 		aus_women_2013
						) player_list 
						left outer join (
									select 		player1, 
												max(fsp_1) as first_serve_pct_1 
									from 		aus_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												max(fsp_2) as first_serve_pct_2
									from 		aus_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2 
			) total_aus_women_table
) D on all_players.player = D.player
) all_match_data
order by best_fsp desc;