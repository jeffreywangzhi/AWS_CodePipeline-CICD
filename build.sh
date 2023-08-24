echo "Building with BUILD_STAGE = $BUILD_STAGE"
case "$BUILD_STAGE" in
UPDATE)
  sam build
  sam deploy --config-file samconfig-update.toml --no-confirm-changeset
  ;;
TEST)
  sam build
  sam deploy --config-file samconfig-test.toml --no-confirm-changeset
  ;;
PROD)
  sam build
  sam deploy --config-file samconfig-prod.toml --no-confirm-changeset
  ;;
*)
  echo "Unknown build stage: $BUILD_STAGE"
  exit 1
  ;;
esac