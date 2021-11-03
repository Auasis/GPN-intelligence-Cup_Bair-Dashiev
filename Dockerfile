FROM httpd:latest
LABEL maitainer="aquilaromana@mail.ru"
COPY index.html /usr/local/apache2/htdocs/
