select 		distinct all_match_data.player,
			all_match_data.gender,
			ifnull(all_match_data.us_open,0) + ifnull(all_match_data.french_open,0) + ifnull(all_match_data.australian_open,0) as total_matches
from (

select 		all_players.player,
			A.total_matches as us_open,
			B.total_matches as french_open,
			C.total_matches as wimbledon,
			D.total_matches as australian_open,
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
						ifnull(total_us_men_table.player1count,0)
							+ ifnull(total_us_men_table.player2count,0) as total_matches
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
												count(player1) as player1count 
									from 		us_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		us_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_us_men_table
) A on all_players.player = A.player

left outer join (
			select 		total_fra_men_table.player, 
						ifnull(total_fra_men_table.player1count,0)
							+ ifnull(total_fra_men_table.player2count,0) as total_matches
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
												count(player1) as player1count 
									from 		fra_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		fra_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_fra_men_table
) B on all_players.player = B.player
left outer join (
			select 		total_wim_men_table.player, 
						ifnull(total_wim_men_table.player1count,0)
							+ ifnull(total_wim_men_table.player2count,0) as total_matches
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
												count(player1) as player1count 
									from 		wim_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		wim_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_wim_men_table
) C on all_players.player = C.player
left outer join (
			select 		total_aus_men_table.player, 
						ifnull(total_aus_men_table.player1count,0)
							+ ifnull(total_aus_men_table.player2count,0) as  total_matches 
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
												count(player1) as player1count 
									from 		aus_men_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		aus_men_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_aus_men_table
) D on all_players.player = D.player

union 

select 		all_players.player,
			A.total_matches as us_open,
			B.total_matches as french_open,
			C.total_matches as wimbledon,
			D.total_matches as australian_open,
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
						ifnull(total_us_women_table.player1count,0)
							+ ifnull(total_us_women_table.player2count,0) as total_matches
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
												count(player1) as player1count 
									from 		us_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		us_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_us_women_table
) A on all_players.player = A.player

left outer join (
			select 		total_fra_women_table.player, 
						ifnull(total_fra_women_table.player1count,0)
							+ ifnull(total_fra_women_table.player2count,0) as total_matches
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
												count(player1) as player1count 
									from 		fra_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		fra_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_fra_women_table
) B on all_players.player = B.player
left outer join (
			select 		total_wim_women_table.player, 
						ifnull(total_wim_women_table.player1count,0)
							+ ifnull(total_wim_women_table.player2count,0) as total_matches
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
												count(player1) as player1count 
									from 		wim_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		wim_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_wim_women_table
) C on all_players.player = C.player
left outer join (
			select 		total_aus_women_table.player, 
						ifnull(total_aus_women_table.player1count,0)
							+ ifnull(total_aus_women_table.player2count,0) as  total_matches 
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
												count(player1) as player1count 
									from 		aus_women_2013 
									group by 	player1
						) player1table on player_list.player = player1table.player1  
						left outer join (
									select 		player2, 
												count(player2) as player2count 
									from 		aus_women_2013 
									group by 	player2
						) player2table on player_list.player = player2table.player2
			) total_aus_women_table
) D on all_players.player = D.player
) all_match_data
order by total_matches desc;