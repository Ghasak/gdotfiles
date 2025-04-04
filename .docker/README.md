# Notes about the formatting for docker
Adding more information about the current file is great.
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

## Current Configuratoins
Since it is not preferable to stow the `.docker/config.json` as it might
contain some sensitive information, here I will add the current configurations
that I need for any machine in the future.
```json

{
  "credsStore": "desktop",
    "imagesFormat":"table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}} \t{{.Size}}",
    "psFormat":"table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.RunningFor}} ago\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
}
```
## Referencees

-  [docker cli](https://docs.docker.com/engine/reference/commandline/cli/)
-  [formatter for docker ](https://github.com/BrianBland/docker/blob/master/api/client/formatter/formatter.go)
