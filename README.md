# accesslogparser
## description
downloads the given accesslog files from given AWS S3 Uri, unzips and searches for a given String (e.g. jndi)

## usage

```
accesslogscheck.sh s3://bucketname/foldername/ MYPROFILENAME yourstring
```