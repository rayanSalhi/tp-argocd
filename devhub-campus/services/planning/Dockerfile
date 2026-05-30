# ---- Stage 1 : build / install des dépendances ----
# On installe dans un venv isolé : un pip global polluerait l'image avec
# pip, wheel, setuptools et les caches — inutiles en prod et sources de CVE.
FROM python:3.12-slim AS build

WORKDIR /app

RUN python -m venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

# ---- Stage 2 : runtime ----
FROM python:3.12-slim AS runtime

LABEL org.opencontainers.image.source="https://github.com/<VOTRE_HANDLE>/devhub-campus" \
      org.opencontainers.image.description="planning-service — DevHub Campus TP2" \
      org.opencontainers.image.licenses="MIT"

WORKDIR /app

COPY --from=build /app/.venv /app/.venv
COPY --from=build /app/app ./app

RUN useradd --uid 1001 --no-create-home --shell /sbin/nologin appuser
USER 1001

ENV PATH="/app/.venv/bin:$PATH" \
    PORT=8080 \
    LOG_LEVEL=info \
    PYTHONUNBUFFERED=1

EXPOSE 8080

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]