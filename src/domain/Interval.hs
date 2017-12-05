module Interval where

import Prelude hiding (read)
import Database.HDBC
import Database.HDBC.PostgreSQL

type Id = Integer
type Name = String
type Surname = String

data Teacher = Teacher {id :: Integer, name :: String, surname :: String} deriving (Show)

-- | adds row to Teacher table
createTeacher :: IConnection a => Name -> Surname -> a -> IO Bool
createTeacher name surname conn = withTransaction conn (createTeacher' name surname)

createTeacher' name surname conn = do
    changed <- run conn query [SqlString name, SqlString surname]
    return $ changed == 1
    where
        query = "insert into sport_univ_teacher (name, surname)" ++
            " values (?, ?)"


-- | return row in Teacher by id
readTeacher :: IConnection a => Id -> a -> IO [Teacher]
readTeacher id conn = do
    result <- quickQuery' conn query [SqlInteger id]
    return $ map unpack result
    where
        query = "select * from sport_univ_teacher where id = ?"
        unpack [SqlInteger uid, SqlByteString name, SqlByteString surname] =
        Teacher uid (BS.unpack name) (BS.unpack surname)
        unpack x = error $ "Unexpected result: " ++ show x


-- | return all rows in Teacher
readAllTeachers :: IConnection a => a -> IO [Teacher]
readAllTeachers conn = do
    result <- quickQuery' conn query []
    return $ map unpack result
    where
        query = "select * from sport_univ_teacher order by id"
        unpack [SqlInteger uid, SqlByteString name, SqlByteString surname] =
            Teacher uid (BS.unpack name) (BS.unpack surname)
        unpack x = error $ "Unexpected result: " ++ show x

        
-- | update row in Teacher by id
updateTeacher :: IConnection a => Id -> Name -> Surname -> a -> IO Bool
updateTeacher uid name surname conn =
    withTransaction conn (updateTeacher' uid name surname)

updateTeacher' uid name surname conn = do
    changed <- run conn query
    [SqlString name, SqlString surname, SqlInteger uid]
    return $ changed == 1
    where
        query = "update sport_univ_teacher set name = ?, surname = ? " ++
                "where id = ?"

-- | delete row in Teacher by id
deleteTeacher :: IConnection a => Id -> a -> IO Bool
deleteTeacher uid conn =
    withTransaction conn (deleteTeacher' uid)

deleteTeacher' uid conn = do
    changed <- run conn query [SqlInteger uid]
    return $ changed == 1
    where
    query = "delete from sport_univ_teacher where id = ?"