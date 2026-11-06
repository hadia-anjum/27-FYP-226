all: build test package

check:
	node tools/build.js src/greeting.md out/greeting.html
	node tools/build.js src/notes.md out/notes.html
	node tools/build.js src/services.md out/services.html

build:
	mkdir -p out
	node tools/build.js src/greeting.md out/greeting.html
	node tools/build.js src/notes.md out/notes.html
	node tools/build.js src/services.md out/services.html

test:
	node test/build.test.js

package:
	npm pack

ci:
	npm ci
	mkdir -p out
	node tools/build.js src/greeting.md out/greeting.html
	node tools/build.js src/notes.md out/notes.html
	node tools/build.js src/services.md out/services.html
	node test/build.test.js
	npm pack

clean:
	rm -rf out *.tgz
