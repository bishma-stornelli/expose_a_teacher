{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Teachers where
 
import Import
import Yesod.Form.Nic (YesodNic, nicHtmlField)

-- Forms

teacherAForm :: AForm App App Teacher
teacherAForm = Teacher
    <$> areq textField "Name" Nothing
    <*> areq nicHtmlField "Biography" Nothing
            
getTeachersR :: Handler RepHtml
getTeachersR = do
    muser <- maybeAuth
    teachers <- runDB $ selectList [] [Asc TeacherId]
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitleI MsgListTeachers
        $(widgetFile "teachers/list")

getTeacherR :: TeacherId -> Handler RepHtml
getTeacherR teacherId = do 
    let handlerName = "getTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/show")

-- Procesa el formulario para crear un profesor
postTeachersR :: Handler RepHtml
postTeachersR = do
    (Entity userId user) <- requireAuth
    ((result,widget), enctype) <- runFormPost $ renderTable teacherAForm
    case result of
        FormSuccess teacher -> do
            tid <- runDB $ insert teacher
            setMessageI MsgTeacherCreated
            redirect $ TeacherR tid
        _ -> defaultLayout $ do
                aDomId <- lift newIdent
                setTitleI MsgCreateTeacher
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

-- Renderiza un formulario para crear un profesor
getNewTeacherR :: Handler RepHtml
getNewTeacherR = do
    (Entity userId user) <- requireAuth
    (widget, enctype) <- generateFormPost $ renderTable teacherAForm
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitleI MsgCreateTeacher
        $(widgetFile "teachers/new")

getEditTeacherR :: TeacherId -> Handler RepHtml
getEditTeacherR teacherId = do
    let handlerName = "getEditTeacherR" :: Text
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitle "Welcome To Yesod!"
        $(widgetFile "teachers/edit")

