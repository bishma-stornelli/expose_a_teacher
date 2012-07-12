{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Teachers where
 
import Import
import Yesod.Form.Nic (YesodNic, nicHtmlField)

-- Forms

teacherAForm :: AForm App App Teacher
teacherAForm = Teacher
    <$> areq textField "Name" Nothing
    <*> areq nicHtmlField "Biography" Nothing
    <*> areq textField "Status" Nothing
-- COMO RAYOS PONGO UN CAMPO EN EL FORMULARIO DE TIPO UserId o cualquier otro foreignKey?
    <*> aopt intField "Recommender"  Nothing
            
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
--    ((result,widget), enctype) <- runFormPost $ teacherAForm Nothing Nothing
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/new")

postEditTeacherR :: TeacherId -> Handler RepHtml
postEditTeacherR teacherId = do
    let handlerName = "putTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/show")

postDeleteTeacherR :: TeacherId -> Handler RepHtml
postDeleteTeacherR teacherId = do
    redirect TeachersR

getNewTeacherR :: Handler RepHtml
getNewTeacherR = do
    (Entity userId user) <- requireAuth
    (widget, enctype) <- generateFormPost $ renderTable teacherAForm
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

