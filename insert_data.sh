#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#Debo crear el database si no existe, y luego conectarme a el a traves de la variable PSQL
PSQL="psql -U postgres -d postgres -c"
echo $($PSQL "CREATE DATABASE worldcup")
PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
#debo dropear la tabla si existe y crear una nueva
echo $($PSQL "DROP TABLE games")
echo $($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY, year INTEGER, round CHAR(15), winner CHAR(20), opponent CHAR(20), winner_goals INTEGER, opponent_goals INTEGER)")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	if [[ $YEAR != 'year' ]] #evito la primera fila, que tiene los encabezados
	then
		echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
		echo $($PSQL "INSERT INTO games(year, round, winner, opponent, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', '$WINNER', '$OPPONENT', $WINNER_GOALS, $OPPONENT_GOALS)")
	fi
done