FROM vfac/envdevphpbase:7.2
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
    git \
	--no-install-recommends

# Add the vscode debian repo
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | apt-key add -
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get update && apt-get -y install \
	code \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
	libcups2 \
	libexpat1 \
	libfontconfig1 \
	libfreetype6 \
	libgtk2.0-0 \
	libpango-1.0-0 \
	libx11-xcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
    nodejs \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV HOME /home/developer
RUN useradd --create-home --home-dir $HOME developer \
    && mkdir /var/www/html -p \
	&& chown -R developer:developer $HOME /var/www/html

COPY start.sh /usr/local/bin/start.sh
RUN chmod 755 /usr/local/bin/start.sh

RUN mkdir -p $HOME/.vscode/extensions $HOME/.config/Code/User && \
    touch $HOME/.config/Code/storage.json && \
    chown -R developer:developer ${HOME}

USER developer
RUN code --install-extension felixfbecker.php-intellisense \
		 --install-extension annsk.alignment \
		 --install-extension HookyQR.beautify \
		 --install-extension patrys.vscode-code-outline \
		 --install-extension PeterJausovec.vscode-docker \
		 --install-extension dbaeumer.jshint \
		 --install-extension DavidAnson.vscode-markdownlint \
		 --install-extension makao.phpcsfixer \
		 --install-extension felixfbecker.php-debug \
		 --install-extension neilbrayfield.php-docblocker \
		 --install-extension felixfbecker.php-pack \
		 --install-extension ikappas.phpcs \
		 --install-extension whatwedo.twig \
		 --install-extension bajdzis.vscode-twig-pack
		 
WORKDIR ${HOME}

ENTRYPOINT [ "/usr/local/bin/start.sh" ]