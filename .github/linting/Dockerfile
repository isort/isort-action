FROM mvdan/shfmt:v3.4.0 as shfmt
FROM koalaman/shellcheck:v0.7.2 as shellcheck

FROM python:3.10.0b2-alpine3.12

RUN apk add --no-cache bash

COPY --from=shfmt /bin/shfmt /usr/local/bin/shfmt
COPY --from=shellcheck /bin/shellcheck /usr/local/bin/shellcheck

COPY .github/linting/requirements.txt requirements.txt
RUN pip install --no-cache -r requirements.txt

WORKDIR /workdir

COPY .github/linting/lint.sh /usr/local/bin/lint
COPY .github/linting/.yamllint /.yamllint
ENTRYPOINT [ "lint" ]
