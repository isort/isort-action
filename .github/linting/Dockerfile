FROM mvdan/shfmt:v3.6.0 as shfmt
FROM koalaman/shellcheck:v0.8.0 as shellcheck

FROM python:3.11.1-alpine3.16

RUN apk add --no-cache bash

COPY --from=shfmt /bin/shfmt /usr/local/bin/shfmt
COPY --from=shellcheck /bin/shellcheck /usr/local/bin/shellcheck

COPY .github/linting/requirements.txt requirements.txt
RUN pip install --no-cache -r requirements.txt

WORKDIR /workdir

COPY .github/linting/lint.sh /usr/local/bin/lint
COPY .github/linting/.yamllint /.yamllint
ENTRYPOINT [ "lint" ]
