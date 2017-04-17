{-# LANGUAGE MagicHash #-}

module Main where

import Java
foreign import java unsafe "@static eta.dl4j.Word2VecRawText.mainfun"
  word2VecRawText :: String->String -> IO ()

main :: IO ()
main = word2VecRawText "/Users/zhangjun/Documents/fudan/paper/run/logfile/Cods.log.2015-01-25" "/Users/zhangjun/code/ibm/eta-example/testoutput"
