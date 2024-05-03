# Stage 1: Build the app
FROM node:22-bookworm as build

# Set the working directory to /app
WORKDIR /app

# Copy package.json and pnpm-lock.yaml to leverage Docker caching
COPY package*.json pnpm-lock.yaml ./

# Install any needed packages specified in package.json
RUN pnpm install

# Copy the app source code
COPY . .

# Run the build script for the indexer package
RUN pnpm --filter indexer build

# Stage 2: Create the optimized production image
FROM node:22-bookworm-slim as production

# Set the working directory to /app
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
COPY --from=build /app/generated/schema.graphql ./generated/schema.graphql
COPY --from=build /app/abis ./abis
COPY --from=build /app/.ponder/logs ./.ponder/logs
COPY --from=build /app/.ponder/sqlite ./.ponder/sqlite

ENTRYPOINT ["/bin/bash"]
