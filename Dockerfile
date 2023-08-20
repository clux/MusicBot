
FROM eclipse-temurin:17-jre-alpine

RUN apk add --no-cache curl && mkdir -p /app
WORKDIR /app

RUN set -ex; \
    release_info=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest); \
    version=$(echo "$release_info" | sed -n 's/.*"tag_name": "\(.*\)".*/\1/p'); \
    file_url="https://github.com/jagrosh/MusicBot/releases/download/$version/JMusicBot-$version.jar"; \
    curl -LJ "$file_url" -o JMusicBot.jar

ENTRYPOINT ["java", "-jar" , "-Dnogui=true", "JMusicBot.jar"]
