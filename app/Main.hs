module Main () where

import Control.Exception

import Database.HDBC
import Database.HDBC.PostgreSQL (connectPostgreSQL)

import Data.Time

import Contributor

-- import ConsoleInterface

handleInput :: IConnection a => a -> IO()
handleInput conn = do
    
    putStrLn "Choose the model: "

    model <- getLine
    
    putStrLn "Choose the operation: "
    operation <- getLine

    let action = (model, operation)
    case action of ("Student", "list") -> listStudentsFromInput conn
                   ("Student", "create") -> createStudentFromInput conn
                   ("Student", "read") -> readStudentFromInput conn
                   ("Student", "update") -> updateStudentFromInput conn
                   ("Student", "delete") -> deleteStudentFromInput conn

                   ("Teacher", "list") -> listTeachersFromInput conn
                   ("Teacher", "create") -> createTeacherFromInput conn
                   ("Teacher", "read") -> readTeacherFromInput conn
                   ("Teacher", "update") -> updateTeacherFromInput conn
                   ("Teacher", "delete") -> deleteTeacherFromInput conn

                   ("Section", "list") -> listSectionsFromInput conn
                   ("Section", "create") -> createSectionFromInput conn
                   ("Section", "read") -> readSectionFromInput conn
                   ("Section", "update") -> updateSectionFromInput conn
                   ("Section", "delete") -> deleteSectionFromInput conn

                   ("Schedule", "list") -> listScheduleFromInput conn
                   ("Schedule", "create") -> createScheduleFromInput conn
                   ("Schedule", "read") -> readScheduleFromInput conn
                   ("Schedule", "update") -> updateScheduleFromInput conn
                   ("Schedule", "delete") -> deleteScheduleFromInput conn

                   ("Competition", "list") -> listCompetitionsFromInput conn
                   ("Competition", "create") -> createCompetitionFromInput conn
                   ("Competition", "read") -> readCompetitionFromInput conn
                   ("Competition", "update") -> updateCompetitionFromInput conn
                   ("Competition", "delete") -> deleteCompetitionFromInput conn
                   ("Competition", "winners") -> listCompetitionsWinnersFromInput conn
                   (_,_) -> putStrLn "Wrong params"

    putStrLn "exit(y/n)"
    isExit <- getLine
    case isExit of "n" -> handleInput conn


main :: IO ()
main = do
    -- conn <- connectPostgreSQL "host=localhost dbname=sport_univ_db user=postgres password=root"

    putStrLn "Available operations: get, list, create, update, delete"
    putStrLn "Available models: Student, Teacher, Section, Schedule, Competition"
    putStrLn "exit - close the app"

    -- handleInput conn

