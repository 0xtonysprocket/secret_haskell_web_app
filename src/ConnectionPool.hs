{-# LANGUAGE OverloadedStrings #-}

module ConnectionPool where

import Data.Pool (PoolConfig(..), Pool, newPool, withResource)
import Database.PostgreSQL.Simple
import Conn

-- \ Pool Config
poolConn :: PoolConfig Connection
poolConn = PoolConfig { 
        createResource = newConn
        , freeResource = delConn 
        , poolCacheTTL = 5
        , poolMaxResources = 10 }

-- | Create a connection pool
initPool :: IO (Pool Connection)
initPool = do
        pool <- newPool poolConn
        return pool
