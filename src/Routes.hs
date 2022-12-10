{-# LANGUAGE OverloadedStrings #-}

module Routes where

import Web.Scotty
import Data.Monoid (mconcat)
import Data.Pool
import Database.PostgreSQL.Simple
import DB

-- | home route
home :: ActionM ()
home = do
    file "homepage.html"

-- | :word route
word :: ActionM ()
word = do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]

-- | add_user route
add_user :: Connection -> User -> IO Bool
add_user conn user = addNewUser conn user
    
