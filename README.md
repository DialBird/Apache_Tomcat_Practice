Tomcat8とApache2.4の連携テンプレ
====

サーブレットの勉強がてら、TomcatとApacheの使い方も学ぼうと作った簡単なもの

## 使い方

- `git clone https://github.com/DialBird/Apache_Tomcat_Practice.git` 
- `cd Apache_Tomcat_Practice && vagrant up`
- `/opt/httpd/httpd-2.4.23/conf/httpd.conf`を書き換える

```
# 以下のコメントアウトを外す
ServerName www.example.com:80
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_ajp_module modules/mod_proxy_ajp.so
```

- tomcatのserver.xmlに以下のコンテキストを追加する
- `<Context path="/app" docBase="/vagrant/app"/>`

- `localhost/app/`にアクセスする
