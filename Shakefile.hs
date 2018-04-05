import Development.Shake
import Development.Shake.FilePath
import System.Directory as Dir

main :: IO ()
main = shakeArgs shakeOptions{ shakeFiles="dist" } $ do
  want ["test"]

  phony "hlint" $
    cmd_ "hlint" "."

  phony "lint" $
    need ["hlint"]

  phony "test" $
    cmd_ "cabal" "test"

  phony "build" $
    cmd_ "cabal" "build"

  phony "haddock" $
    cmd_ "cabal" "haddock"

  "dist/terntup-0.0.1.tar.gz" %> \_ -> do
    need ["build", "haddock"]
    cmd_ "cabal" "sdist"

  phony "sdist" $ do
    need ["dist/terntup-0.0.1.tar.gz"]

  phony "publish" $ do
    need ["sdist"]
    cmd_ "cabal" "upload" "dist/terntup-0.0.1.tar.gz"

  phony "clean" $
    cmd_ "cabal" "clean"
