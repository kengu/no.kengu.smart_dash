# Use latest stable channel SDK.
FROM dart:stable AS build

# Set the work directory
WORKDIR /app

# Copy the necessary files (except anything in .dockerignore)
#COPY pubspec.* ./
COPY . .

# Get dependencies
RUN dart pub get

# Compile the Dart app to an executable
RUN dart compile exe bin/main.dart -o /app/main

# Final stage to build a minimal image with only the executable
FROM scratch

# Copy the executable from the build stage
COPY --from=build /app/main /app/main

# Expose port 8080 for the server
EXPOSE 8080

# Set the entrypoint to the compiled executable
ENTRYPOINT ["/app/main"]