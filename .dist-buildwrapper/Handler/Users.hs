{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Users where

import Import

getUsersR :: Handler RepHtml
getUsersR = do
    let handlerName = "getReviewsR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/list")
        
        
getUserR :: UserId -> Handler RepHtml
getUserR userId = do
    let handlerName = "getReviewsR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/list")
        
postUserR :: UserId -> Handler RepHtml
postUserR userId = do
    runDB $ delete userId
    setMessageI MsgUserBlocked
    redirect UsersR