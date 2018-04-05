import Development.Shake
import Development.Shake.FilePath
import System.Directory as Dir

main :: IO ()
main = do
  let tarball = "dist/terntup-0.0.1.tar.gz"
  shakeArgs shakeOptions{ shakeFiles="dist" } $ do
    want ["test"]

    phony "hlint" $
      cmd_ "hlint" "."

    phony "lint" $
      need ["hlint"]

    phony "test" $
      cmd_ "cabal" "test"

    phony "install" $
      cmd_ "cabal" "install"

    phony "uninstall" $
      cmd_ "ghc-pkg" "unregister" "--force" "terntup"

    phony "build" $
      cmd_ "cabal" "build"

    phony "haddock" $
      cmd_ "cabal" "haddock"

    tarball %> \_ -> do
      need ["build", "haddock"]
      cmd_ "cabal" "sdist"

    phony "sdist" $
      need [tarball]

    phony "publish" $ do
      need ["sdist"]
      cmd_ "cabal" "upload" tarball

    phony "clean" $
      cmd_ "cabal" "clean"
