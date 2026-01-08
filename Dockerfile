FROM node:24-alpine AS builder

WORKDIR /app

COPY next.config.ts tsconfig.json package.json ./
COPY app app
COPY public public
COPY node_modules node_modules

RUN npm run build

FROM gcr.io/distroless/nodejs20-debian11@sha256:8cf9967ae9ba1e64089f853abac42b41f2af95ff3aa00d08c26e5f75714605d4 AS runtime

WORKDIR /app

COPY --from=builder /app/.next/standalone /app
COPY --from=builder /app/.next/static /app/.next/static
COPY --from=builder /app/public /app/public

EXPOSE 3000

ENV NODE_ENV=production

CMD ["server.js"]