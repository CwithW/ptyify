all:linux_x86 linux_amd64 linux_arm linux_arm64

linux_x86:
	CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -trimpath -ldflags "-s -w" -o "dist/ptyify_linux_x86"

linux_amd64:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -ldflags "-s -w" -o "dist/ptyify_linux_amd64"

linux_arm:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -trimpath -ldflags "-s -w" -o "dist/ptyify_linux_arm"

linux_arm64:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -trimpath -ldflags "-s -w" -o "dist/ptyify_linux_arm64"