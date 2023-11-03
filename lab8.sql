-- Retrieve a list of all the games, ordered by date with the most recent game coming first
SELECT ID
FROM Game
ORDER BY time ASC;
-- Retrieve all the games that occurred in the past week.
SELECT ID
FROM Game
WHERE time > '2023-10-20 00:00:00'
-- Retrieve a list of players who have (non-NULL) names.
SELECT Player.name
FROM Player
WHERE Player.name IS NOT NULL
-- Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT Player.name
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID AND PlayerGame.score > 2000
-- Retrieve a list of players who have GMail accounts.
SELECT Player.name
FROM Player
WHERE Player.emailAddress LIKE '%@gmail.com'
--
-- Retrieve all “The King”’s game scores in decreasing order.
SELECT PlayerGame.score
FROM PlayerGame, Player
WHERE PlayerGame.playerID = Player.ID AND Player.name = 'The King'
-- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT Player.name
FROM Player, Game, PlayerGame
WHERE Game.time = '2006-06-28 13:20:00' AND PlayerGame.gameID = Game.ID AND PlayerGame.score = MAX(PlayerGame.score)
-- So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?
-- It makes it so that you only get one of the two possible combinations of players. If you didn't have that clause, you would get both (P1, P2) and (P2, P1) as possible combinations.
-- The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
-- You could join a table to itself if you wanted to compare two different attributes of the same table. For example, if you wanted to compare the scores of two different players in the same game, you could join the PlayerGame table to itself.
