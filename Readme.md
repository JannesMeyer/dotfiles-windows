# Setup PowerShell

	Set-ExecutionPolicy Unrestricted -Scope CurrentUser

[How to add Trusted Sites to Internet Explorer](https://www.itg.ias.edu/content/how-add-trusted-sites-internet-explorer)

# Git

Install latest [Git](https://git-scm.com/)

# npm

Install latest [Node.js](https://nodejs.org/)

	npm config set strict-ssl false
	npm config set ca ""
	npm config set registry http://registry.npmjs.org/
	npm config set python python2.7

[Troubleshooting](https://github.com/npm/npm/wiki/Troubleshooting)

# Setup protractor

Install https://github.com/Microsoft/nodejstools
Install latest [Java](https://java.com/en/download/)
Install latest [Python 2.x](https://www.python.org/downloads/)

	npm install
	./node_modules/.bin/webdriver-manager update --ignore_ssl
	./node_modules/.bin/webdriver-manager start
	./node_modules/.bin/protractor protractor.conf

# Upgrade npm

	npm install -g npm-windows-upgrade
	npm-windows-upgrade

# Run HTTP server

Node (`npm install -g serve`):

	serve

Python 3:

	python -m http.server

Python 2:

	python -m SimpleHTTPServer