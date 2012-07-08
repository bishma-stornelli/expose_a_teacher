{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Teachers where
 
import Import

getTeachersR :: Handler RepHtml
getTeachersR = do
    teachers <- runDB $ selectList [] [Asc TeacherId]
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/list")

getTeacherR :: TeacherId -> Handler RepHtml
getTeacherR teacherId = do
    let handlerName = "getTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/show")

postTeachersR :: Handler RepHtml
postTeachersR = do
    let handlerName = "postTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/new")

putTeacherR :: TeacherId -> Handler RepHtml
putTeacherR teacherId = do
    let handlerName = "putTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/show")

deleteTeacherR :: TeacherId -> Handler RepHtml
deleteTeacherR teacherId = do
    redirect TeachersR

getNewTeacherR :: Handler RepHtml
getNewTeacherR = do
    let handlerName = "getNewTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/new")

getEditTeacherR :: TeacherId -> Handler RepHtml
getEditTeacherR teacherId = do
    let handlerName = "getEditTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/edit")