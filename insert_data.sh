#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#En el caso que quiera crear el database descomento las siguientes dos lineas
#PSQL="psql -U postgres -d postgres -c"
#echo $($PSQL "CREATE DATABASE worldcup")

#creo las tablas
#Primero creo la tabla teams porque team_id sera foreign key de la tabla games
echo $($PSQL "CREATE TABLE teams(
	team_id SERIAL NOT NULL PRIMARY KEY, 
	name VARCHAR(15) NOT NULL UNIQUE
);")
echo $($PSQL "CREATE TABLE games(
	game_id SERIAL NOT NULL PRIMARY KEY, 
	year INTEGER NOT NULL, 
	round VARCHAR(15) NOT NULL, 
	winner_id INTEGER NOT NULL REFERENCES teams(team_id), 
	opponent_id INTEGER NOT NULL REFERENCES teams(team_id), 
	winner_goals INTEGER NOT NULL, 
	opponent_goals INTEGER NOT NULL
);")
#lleno las tablas
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
	#evito la primera fila, que tiene los encabezados
	if [[ $YEAR != 'year' ]] 
	then
		#busco en la tabla equipos los id de los equipos que estoy viendo, tanto perdedor como ganador, si es que ya existen en la tabla
		WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
		LOSER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
		#si el ganador no existe en la tabla de equipos
		if [[ -z $WINNER_TEAM_ID ]] 
		then
			#Inserto al equipo en la tabla de equipos
			echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
			#ahora si obtengo su id asigando por serial
			WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
		fi
		#si el perdedor no existe en la tabla de equipos
		if [[ -z $LOSER_TEAM_ID ]] 
		then
			#Inserto al equipo en la tabla de equipos
			echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
			#ahora si obtengo su id asigando por serial
			LOSER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
		fi
		#usando el team_id que se le asigno a los equipos en la tabla teams, guardo los datos en la tabla games
		echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $LOSER_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
	fi
done