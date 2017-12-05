module Contributor where


import Prelude hiding (read)
import Database.HDBC
import Database.HDBC.PostgreSQL

type Id = Integer
type FirstName = String
type LastName = String
type Email = String
data Position = Teacher | Student deriving (Eq, Ord, Enum, Show)

data Contributor = Contributor {
    id :: Id,
    first_name :: FirstName,
    last_name :: LastName,
    email :: Email, 
    position :: Position
    } deriving (Show)

createContributor :: IConnection a => FirstName -> LastName -> Email -> Position -> a -> IO Bool
createContributor firstName lastName email position connection = withTransaction conn (createTeacher' name surname)
