{-# LANGUAGE MagicHash #-}
{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}


import Java
import Control.Applicative
import Options

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

data User = User
  { userId        :: Int
  , userFirstName :: String
  , userLastName  :: String
  } deriving (Eq, Show)

$(deriveJSON defaultOptions ''User)

type API = "users" :> Get '[JSON] [User]

startApp :: IO ()
startApp = run 8080 app

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = return users

users :: [User]
users = [ User 1 "Isaac" "Newton"
        , User 2 "Albert" "Einstein"
        ]


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


main = startApp

main1 :: IO ()
main1 = runCommand $ \opts args -> do
		word2VecRawText "/Users/zhangjun/Documents/fudan/paper/run/logfile/Cods.log.2015-01-25" "/Users/zhangjun/code/ibm/eta-example/testoutput"
		print $ message opts
