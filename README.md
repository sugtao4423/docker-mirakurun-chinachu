# docker-mirakurun-chinachu
`mirakurun`と`chinachu`を1つのDockerコンテナに突っ込んだ

## mirakurun conf
`mirakurun/conf/`の中に`channels.yml` `server.yml` `tunners.yml`を突っ込む。  
このリポジトリではすでに配置してあるが、自身のものを入れる場合は上書きする。

## Chinachuの録画データの保存ディレクトリ
`docker-compose.yml`にもある通り

* `/home/Chinachu/recorded/:/Chinachu/recorded/`
* `/home/Chinachu/tmp/:/Chinachu/tmp/`

である。  
(ホスト:コンテナ)

## Recorded Scripts
Chinachuの録画終了時に指定のスクリプトを実行する機能。

自分向けのカスタマイズをしてあり、phpやgit(ssh)を叩くので`Dockerfile`にそれ関連のインストール記述がある。  
それらが不要な場合、以下4つを削除しても大丈夫だと思う。

* `chinachu/recordedScripts/*`
* `chinachu/ssh/*`
* `docker/Dockerfile`のOptionalからEndまで
* `docker-compose.yml`の中、`Optional`下の`recordedScripts` `ssh`の2行

