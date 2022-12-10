{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Web.Scotty
import Data.Pool
import Control.Monad.IO.Class
import Routes
import ConnectionPool
import DB

main :: IO ()
main = do
    connectionPool <- initPool
    scotty 3000 $ do
        get "/" home

        get "/:word" word

        post "/add_user" $ do
            user <- jsonData :: ActionM User
            bool <- liftAndCatchIO $ withResource connectionPool $ \conn -> add_user conn user
            if bool
                then text "User added"
                else text "User not added"
