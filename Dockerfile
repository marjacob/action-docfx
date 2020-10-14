FROM mono:latest

RUN apt-get update \
	&& apt-get install -qq unzip wkhtmltopdf \
	&& rm -rf /var/lib/apt/lists/*

ADD https://github.com/dotnet/docfx/releases/latest/download/docfx.zip /tmp/

RUN unzip /tmp/docfx.zip -d /opt/docfx \
	&& rm -f /tmp/docfx.zip \
	&& apt-get purge -qq unzip

ADD docfx.sh /usr/local/bin/docfx

ENTRYPOINT [ "docfx" ]
CMD [ "help" ]