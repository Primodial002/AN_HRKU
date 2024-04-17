FROM 5hojib/aeon:latest
WORKDIR /usr/src/app
RUN pip uninstall yt-dlp -y
RUN pip install yt-dlp==2023.10.7
COPY . .
CMD ["bash", "start.sh"]
