{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Reviews where

import Import

getReviewsR :: Handler RepHtml
getReviewsR = do
    let handlerName = "getReviewsR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/list")
        
postReviewsR :: Handler RepHtml
postReviewsR = do
    let handlerName = "postReviewR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/show")
        
putReviewR :: ReviewId -> Handler RepHtml
putReviewR reviewId = do
    let handlerName = "putReviewR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/edit")
        
deleteReviewR :: ReviewId -> Handler RepHtml
deleteReviewR  reviewId = do
    let handlerName = "deleteReviewR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/show")
        
getEditReviewR :: ReviewId -> Handler RepHtml
getEditReviewR reviewId = do
    let handlerName = "getEditReviewR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/edit")
        
getReportedReviewsR :: Handler RepHtml
getReportedReviewsR = do
    let handlerName = "getReportedReviewsR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/reported")
        
postReportedReviewR :: ReviewId -> Handler RepHtml
postReportedReviewR reviewId = do
    let handlerName = "postReportedReviewR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/show")
        
putReportedReviewR :: ReviewId -> Handler RepHtml
putReportedReviewR reviewId = do
    let handlerName = "putReportedReviewR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "reviews/reported")