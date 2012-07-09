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
		
putUserR :: UserId ->Handler RepHtml
putUserR userId = do
    let handlerName = "getReviewsR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/list")
		
deleteUserR :: UserId ->Handler RepHtml
deleteUserR userId = do
    let handlerName = "getReviewsR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/list")