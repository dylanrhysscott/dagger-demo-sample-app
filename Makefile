build:
	dagger -m github.com/dylanrhysscott/dagger-go-pipeline call build --name=sample-app --build-context=. as-service up
build-publish:
	dagger -m github.com/dylanrhysscott/dagger-go-pipeline call \
		with-registry \
			--registry-host="ghcr.io/dylanrhysscott/dagger-demo-sample-app" \
			--registry-username="env:GITHUB_USERNAME" \
			--registry-password="env:GITHUB_TOKEN" \
		build \
			--name sample-app \
			--build-context . \
		publish \
			--address="ghcr.io/dylanrhysscott/dagger-demo-sample-app:latest"
