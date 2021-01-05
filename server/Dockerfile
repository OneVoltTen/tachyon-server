# Dav-Edward/TachyonsCE
FROM openjdk:7

# If there's a new update delete the downloaded files
git clone https://github.com/Dav-Edward/TachyonsCE
COPY ./client /usr/src/TachyonsCE

WORKDIR /usr/src/TachyonsCE/server

# Either work
RUN javac Tachyon.java
CMD ["java", "Tachyon"]

# or

# RUN StartServerConsole.sh