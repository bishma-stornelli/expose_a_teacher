module Paths_expose_a_teacher_yesod (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/tamerdark/.cabal/bin"
libdir     = "/home/tamerdark/.cabal/lib/expose-a-teacher-yesod-0.0.0/ghc-7.4.1"
datadir    = "/home/tamerdark/.cabal/share/expose-a-teacher-yesod-0.0.0"
libexecdir = "/home/tamerdark/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "expose_a_teacher_yesod_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "expose_a_teacher_yesod_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "expose_a_teacher_yesod_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "expose_a_teacher_yesod_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
