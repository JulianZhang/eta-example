{-# LANGUAGE MagicHash #-}

import Java
import Control.Applicative
import Options



data MainOptions = MainOptions
	{ port :: Int
	, message :: String
	}

instance Options MainOptions where
    	defineOptions = pure MainOptions
    		<*> simpleOption "port" 8088
    		    "the port for web service "
    		<*> simpleOption "message" "test message"
    		    "message for testing."

foreign import java unsafe "@static eta.dl4j.Word2VecRawText.mainfun"
  word2VecRawText :: String->String -> IO ()

main :: IO ()
main = runCommand $ \opts args -> do
		word2VecRawText "/Users/zhangjun/Documents/fudan/paper/run/logfile/Cods.log.2015-01-25" "/Users/zhangjun/code/ibm/eta-example/testoutput"
		print $ message opts
