# Notes about the formatting for docker

## Current configuration support

```shell
Docker version 20.10.22, build 3a2c30b
```

## Docker Formatting
There are several ways to display your images and containers or other format
These are the default values , notice the name here is different from the one we will use for the `.docker/config.json`
```shell
	defaultContainerTableFormat       = "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.RunningFor}} ago\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
	defaultImageTableFormat           = "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}} ago\t{{.Size}}"
	defaultImageTableFormatWithDigest = "table {{.Repository}}\t{{.Tag}}\t{{.Digest}}\t{{.ID}}\t{{.CreatedSince}} ago\t{{.Size}}"
	defaultQuietFormat                = "{{.ID}}"
```

first line is used to format the command `docker image ls`
```shell
    "imagesFormat":"table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}} \t{{.Size}}",
```

the second line is used to format the command `docker container ps -a`
```shell
"psFormat":"table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.RunningFor}} ago\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
```

You can change the sequence of the what to display according to the requested/desirable format.
- Here is the one I used before,
```shell
"psFormat"="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATE\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"
```
which is not supported anymore, it should be changed to the one above, as

```shell
"psFormat":"table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.RunningFor}} ago\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
```

As we just need to add `table` infornt.
