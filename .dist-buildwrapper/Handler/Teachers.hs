{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Teachers where
 
import Import
import Yesod.Form.Nic (YesodNic, nicHtmlField)

-- Forms

teacherAForm :: Maybe Teacher -> AForm App App Teacher
teacherAForm mtea = Teacher
    <$> areq textField "Name" (teacherName <$> mtea)
    <*> areq nicHtmlField "Biography" (teacherBiography <$> mtea)
            
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
    teacher <- runDB $ get404 teacherId
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitleI MsgShowTeacher
        $(widgetFile "teachers/show")

-- Procesa el formulario para crear un profesor
postTeachersR :: Handler RepHtml
postTeachersR = do
    (Entity userId user) <- requireAuth
    ((result,widget), enctype) <- runFormPost $ renderTable $ teacherAForm Nothing
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
    (Entity userId user) <- requireAuth
    tea <- runDB $ get404 teacherId
    ((result,widget), enctype) <- runFormPost $ renderTable $ teacherAForm $ Just tea
    case result of
        FormSuccess teacher -> do
            runDB $ update teacherId [TeacherName =. teacherName teacher, 
                                        TeacherBiography =. teacherBiography teacher]
            setMessageI MsgTeacherUpdated
            redirect $ TeacherR teacherId
        _ -> defaultLayout $ do
                aDomId <- lift newIdent
                setTitleI MsgEditTeacher
                $(widgetFile "teachers/new")

postDeleteTeacherR :: TeacherId -> Handler RepHtml
postDeleteTeacherR teacherId = do
    runDB $ delete teacherId
    setMessageI MsgTeacherDeleted
    redirect TeachersR

-- Renderiza un formulario para crear un profesor
getNewTeacherR :: Handler RepHtml
getNewTeacherR = do
    (Entity userId user) <- requireAuth
    (widget, enctype) <- generateFormPost $ renderTable $ teacherAForm Nothing
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitleI MsgCreateTeacher
        $(widgetFile "teachers/new")

getEditTeacherR :: TeacherId -> Handler RepHtml
getEditTeacherR teacherId = do
    (Entity userId user) <- requireAuth
    tea <- runDB $ get404 teacherId
    (widget, enctype) <- generateFormPost $ renderTable $ teacherAForm $ Just tea
    defaultLayout $ do
        aDomId <- lift newIdent
        setTitleI MsgCreateTeacher
        $(widgetFile "teachers/edit")

