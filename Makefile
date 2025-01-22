make: setup
	@if command -v cursor >/dev/null 2>&1; then \
		cursor --install-extension $(wildcard *.vsix); \
	else \
		code --install-extension $(wildcard *.vsix); \
	fi

setup:
	@if command -v brew >/dev/null 2>&1; then \
		which vsce > /dev/null 2>&1 || brew install vsce; \
	else \
		which vsce > /dev/null 2>&1 || npm install -g @vscode/vsce; \
	fi
	vsce package
