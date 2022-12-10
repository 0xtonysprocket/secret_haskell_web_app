{-# LANGUAGE OverloadedStrings #-}

module Conn where

import Database.PostgreSQL.Simple

-- | Database Config
localPG :: ConnectInfo
localPG = defaultConnectInfo 
        { connectHost = "127.0.0.1"
        , connectDatabase = "web_app_db"
        , connectUser = "leon"
        , connectPassword = "1234"
        }

-- | Connect to the database
newConn :: IO Connection
newConn = do
    conn <- connect localPG
    return conn

-- | Disconnect from the database
delConn :: Connection -> IO ()
delConn conn = close conn