{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module DB where

import Data.Pool
import GHC.Generics
import Database.PostgreSQL.Simple
import ConnectionPool
import Control.Monad.IO.Class
import Data.Aeson

-- | Define User data type
data User = User {  idNum :: Int,
                    name :: String,
                    userType :: String,
                    rfps :: String,
                    bids :: String
                 } deriving (Show, Generic)

instance ToJSON User
instance FromJSON User

-- | Add User to the database
addNewUser :: Connection -> User -> IO Bool
addNewUser conn user  = do
    n <- execute conn "INSERT INTO users VALUES (?, ?, ?, ?, ?)" $ (idNum user, name user, userType user, rfps user, bids user)
    return $ n > 0



