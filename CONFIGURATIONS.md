**Note:** For users deploying on low-resource systems (e.g., small VPS), please refer to the section "[Running on Low-Resource Environments](#running-on-low-resource-environments-eg-500mb-ram-vps)" at the end of this document for specific guidance and optimized configurations.


## 1. Required Fields

| Variable        | Type   | Description                                                                                  |
|----------------|--------|----------------------------------------------------------------------------------------------|
| `BOT_TOKEN`     | `str`  | Telegram Bot Token obtained from [@BotFather](https://t.me/BotFather).                        |
| `OWNER_ID`      | `int`  | Telegram User ID (not username) of the bot's owner.                                           |
| `TELEGRAM_API`  | `int`  | API ID used to authenticate your Telegram account. Obtainable from [my.telegram.org](https://my.telegram.org). |
| `TELEGRAM_HASH` | `str`  | API hash used to authenticate your Telegram account. Obtainable from [my.telegram.org](https://my.telegram.org). |

## 2. Optional Fields

| Variable                  | Type           | Description |
|---------------------------|----------------|-------------|
| `TG_PROXY`                | `dict`         | Proxy settings as dict. Example: `{"scheme": "socks5", "hostname": "11.22.33.44", "port": 1234, "username": "user", "password": "pass"}`. Username/password optional. |
| `USER_SESSION_STRING`     | `str`          | Use to access Telegram premium features. Generate using `python3 generate_string_session.py`. **Note:** Use in supergroup only. |
| `DATABASE_URL`            | `str`          | MongoDB connection string. See [Create Database](https://github.com/anasty17/test?tab=readme-ov-file#create-database). Data includes bot/user settings, RSS, and tasks. |
| `CMD_SUFFIX`              | `str` \| `int` | Suffix to add at the end of all commands. |
| `AUTHORIZED_CHATS`        | `str`          | User/chat/topic IDs to authorize. Format: `chat_id`, `chat_id|thread_id`, etc. Separate by spaces. |
| `SUDO_USERS`              | `str`          | User IDs with sudo permission. Separate by spaces. |
| `UPLOAD_PATHS`            | `dict`         | Dict with upload paths. Example: `{"path 1": "remote:", "path 2": "gdrive id", ...}` |
| `DEFAULT_UPLOAD`          | `str`          | `rc` for `RCLONE_PATH`, `gd` for `GDRIVE_ID`. Default: `rc`. [Read More](https://github.com/anasty17/mirror-leech-telegram-bot/tree/master#upload). |
| `EXCLUDED_EXTENSIONS`     | `str`          | File extensions to skip. Separate by spaces. |
| `INCOMPLETE_TASK_NOTIFIER`| `bool`         | Notify after restart for incomplete tasks. Needs DB and supergroup. Default: `False`. |
| `FILELION_API`            | `str`          | API key from [Filelion](https://vidhide.com/?op=my_account). |
| `STREAMWISH_API`          | `str`          | API key from [Streamwish](https://streamwish.com/?op=my_account). |
| `YT_DLP_OPTIONS`          | `dict`         | Dict of `yt-dlp` options. [Docs](https://github.com/yt-dlp/yt-dlp/blob/master/yt_dlp/YoutubeDL.py#L184). [Convert script](https://t.me/mltb_official_channel/177). |
| `USE_SERVICE_ACCOUNTS`    | `bool`         | Use Google API service accounts. See [guide](https://github.com/anasty17/mirror-leech-telegram-bot#generate-service-accounts-what-is-service-account). |
| `FFMPEG_CMDS`             | `dict`         | Dict with lists of ffmpeg commands. Start with arguments only. Use `-ff key` to apply. Add `-del` to auto-delete source. See example and notes. |
| `NAME_SUBSTITUTE`         | `str`          | Replace/remove words/characters using `source/target` format. Use `\` for escaping special characters. |

## 3. GDrive Tools

| Variable        | Type   | Description |
|----------------|--------|-------------|
| `GDRIVE_ID`     | `str`  | Folder/TeamDrive ID or `root`. |
| `IS_TEAM_DRIVE` | `bool` | Set `True` for TeamDrive. Default: `False`. |
| `INDEX_URL`     | `str`  | [Reference](https://gitlab.com/ParveenBhadooOfficial/Google-Drive-Index). |
| `STOP_DUPLICATE`| `bool` | Check for duplicate file/folder names. Default: `False`. |

## 4. Rclone

| Variable            | Type   | Description |
|---------------------|--------|-------------|
| `RCLONE_PATH`        | `str`  | Default upload path. |
| `RCLONE_FLAGS`       | `str`  | Use `--key:value|--key` format. [Flags](https://rclone.org/flags/). |
| `RCLONE_SERVE_URL`   | `str`  | Bot URL. Example: `http://myip` or `http://myip:port`. |
| `RCLONE_SERVE_PORT`  | `int`  | Port. Default: `8080`. |
| `RCLONE_SERVE_USER`  | `str`  | Serve username. |
| `RCLONE_SERVE_PASS`  | `str`  | Serve password. |

## 5. Update

| Variable         | Type  | Description |
|------------------|-------|-------------|
| `UPSTREAM_REPO`   | `str` | GitHub repo link. For private, use `https://username:token@github.com/username/repo`. [Get token](https://github.com/settings/tokens). |
| `UPSTREAM_BRANCH` | `str` | Branch to use. Default: `master`. |

## 6. Leech

| Variable                | Type            | Description |
|-------------------------|-----------------|-------------|
| `LEECH_SPLIT_SIZE`       | `int`           | Split size in bytes. Default: `2GB`, `4GB` for premium. |
| `AS_DOCUMENT`            | `bool`          | Upload as document. Default: `False`. |
| `USER_TRANSMISSION`      | `bool`          | Use user session for UL/DL in supergroups. Default: `False`. |
| `HYBRID_LEECH`           | `bool`          | Switch sessions based on file size. Default: `False`. |
| `LEECH_FILENAME_PREFIX`  | `str`           | Add prefix to file name. |
| `LEECH_DUMP_CHAT`        | `list[str/int]` | Chat/channel to send files. Use `-100` prefix or `chat_id|thread_id`. |
| `THUMBNAIL_LAYOUT`       | `str`           | Layout like `2x2`, `4x4`, `3x3`, etc. |

## 7. qBittorrent/Aria2c/Sabnzbd

| Variable           | Type   | Description |
|--------------------|--------|-------------|
| `TORRENT_TIMEOUT`   | `int`  | Timeout in seconds for dead torrents. |
| `BASE_URL`          | `str`  | Bot URL. Example: `http://myip` or `http://myip:port`. |
| `BASE_URL_PORT`     | `int`  | Port. Default: `80`. |
| `WEB_PINCODE`       | `bool` | Ask PIN before file selection. Default: `False`. |

## 8. JDownloader

| Variable     | Type  | Description |
|--------------|-------|-------------|
| `JD_EMAIL`    | `str` | Email for [JDownloader](https://my.jdownloader.org/). |
| `JD_PASS`     | `str` | Password. You may zip `cfg/` as `cfg.zip` and include in repo. |

## 9. Sabnzbd

| Variable        | Type   | Description |
|-----------------|--------|-------------|
| `USENET_SERVERS` | `list` | List of dicts with Usenet server config. Example:
```
[{'name': 'main', 'host': '', 'port': 563, 'timeout': 60, 'username': '', 'password': '', 'connections': 8, 'ssl': 1, 'ssl_verify': 2, 'ssl_ciphers': '', 'enable': 1, 'required': 0, 'optional': 0, 'retention': 0, 'send_group': 0, 'priority': 0}]
```
[More info](https://sabnzbd.org/wiki/configuration/4.2/servers)

## 10. RSS

| Variable         | Type         | Description |
|------------------|--------------|-------------|
| `RSS_DELAY`       | `int`        | Time interval in seconds. Default: `600`. |
| `RSS_SIZE_LIMIT`  | `int`        | Max item size in bytes. Default: `0`. |
| `RSS_CHAT`        | `str`/`int`  | Chat ID or username. Use `channel|topic` format if needed. |

**Note:** `RSS_CHAT` is mandatory. Requires either `USER_SESSION_STRING` or linked group/channel setup.

## 11. Queue System

| Variable          | Type  | Description |
|-------------------|-------|-------------|
| `QUEUE_ALL`        | `int` | Max concurrent upload + download tasks. |
| `QUEUE_DOWNLOAD`   | `int` | Max concurrent download tasks. |
| `QUEUE_UPLOAD`     | `int` | Max concurrent upload tasks. |

## 12. NZB Search

| Variable         | Type  | Description |
|------------------|-------|-------------|
| `HYDRA_IP`        | `str` | IP of [nzbhydra2](https://github.com/theotherp/nzbhydra2). |
| `HYDRA_API_KEY`   | `str` | API key from nzbhydra2. |

## 13. Extra fields from Aeon

| Variable               | Type   | Description |
|------------------------|--------|-------------|
| `METADATA_KEY`         | `str`  | Key used to tag or fetch metadata. |
| `WATERMARK_KEY`        | `str`  | Key used for watermarking files or content. |
| `SET_COMMANDS`         | `bool` | Whether to register bot commands on startup. |
| `TOKEN_TIMEOUT`        | `int`  | Timeout in seconds for token/session expiry. |
| `PAID_CHANNEL_ID`      | `int`  | Telegram channel ID where user need to join for no token. |
| `PAID_CHANNEL_LINK`    | `str`  | Invite or public link to the paid Telegram channel. |
| `DELETE_LINKS`         | `bool` | Whether to auto-delete download or share links. |
| `FSUB_IDS`             | `str`  | Comma-separated IDs of forced subscription channels. |
| `LOG_CHAT_ID`          | `int`  | Chat ID where leech logs sent. |
| `LEECH_FILENAME_CAPTION` | `str` | Template caption used for leeched/downloaded filenames. |
| `INSTADL_API`          | `str`  | URL or endpoint for InstaDL API integration. |
| `HEROKU_APP_NAME`      | `str`  | Name of the Heroku app for get `BASE_URL` automatically. |
| `HEROKU_API_KEY`       | `str`  | API key for accessing and controlling Heroku. |

## Running on Low-Resource Environments (e.g., 500MB RAM VPS)

This bot can be demanding on system resources if all features are enabled and used heavily. To run the bot effectively on a low-resource VPS, consider the following:

### 1. Dependencies
The `requirements.txt` file includes libraries for all supported features. Some of these can be memory-intensive. Review the dependency analysis provided during setup (or in a separate `OPTIMIZATIONS.md` if generated) and consider removing any libraries corresponding to features you do not intend to use. For example, if you don't use Google Drive, qBittorrent, or JDownloader, their respective libraries (`google-api-python-client`, `aioqbt`, etc.) can be removed from `requirements.txt` before building the Docker image or installing locally.

### 2. Configuration Adjustments
The `config_sample.py` (which you should copy to `config.py` or set via environment variables) has been pre-configured with some conservative defaults suitable for low-resource systems:
    - **`QUEUE_ALL = 2`**, **`QUEUE_DOWNLOAD = 1`**, **`QUEUE_UPLOAD = 1`**: Limits concurrent tasks. Avoid increasing these significantly.
    - **`RSS_DELAY = 1800`**: RSS feeds are checked every 30 minutes. Increase if you have many feeds or don't need frequent updates.
    - **`YT_DLP_OPTIONS = '{ "format": "best[height<=480][ext=mp4]/best[ext=mp4]/best", ... }'`**: Downloads videos in lower resolution (480p) and mp4 format to save CPU and bandwidth. Modify this if you need higher quality, but be mindful of resource impact.
    - **`TORRENT_TIMEOUT = 300`**: Helps clear unresponsive torrents.

### 3. Resource-Intensive Features:
    - **FFmpeg (`FFMPEG_CMDS`)**: Complex FFmpeg operations (e.g., transcoding, adding subtitles) are very CPU and memory intensive. The default `FFMPEG_CMDS = {}` disables these. If you add custom FFmpeg commands, use them sparingly and test their resource usage.
    - **`yt-dlp` (High-Quality Downloads)**: Downloading high-resolution videos (720p, 1080p, 4K) or converting formats with `yt-dlp` can consume significant CPU and RAM. Stick to the optimized `YT_DLP_OPTIONS` or use these features during off-peak hours.
    - **File Splitting (`LEECH_SPLIT_SIZE`)**: While useful for Telegram's file size limits, splitting very large files can temporarily consume a lot of memory and disk I/O. The default `LEECH_SPLIT_SIZE = 0` (no split) is set to avoid this. If you need splitting, ensure your VPS has enough swap space or monitor memory usage.
    - **Web Server/API (`fastapi`, `gunicorn`, `uvicorn`)**: If you do not need the web interface or API functionalities of the bot, consider not installing these dependencies to save resources. (This would require customizing `requirements.txt`).
    - **Simultaneous Large Transfers**: Even with queue limits, initiating multiple transfers of very large files (especially to/from cloud storage like Google Drive or Rclone remotes) can strain a low-resource VPS. Monitor your system if you frequently handle multi-GB files.

### 4. Monitoring
Regularly monitor your VPS's RAM and CPU usage, especially when the bot is actively downloading or uploading. Tools like `htop` or `docker stats` (if running in Docker) can be helpful. If you consistently hit resource limits, you may need to further restrict bot features, reduce concurrency, or consider a VPS with more resources.