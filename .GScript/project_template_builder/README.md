# Project Generation

## Objective


## Requirements

- You need this function in your sourced `.alias` to copy the necessary files from your directory. (.G => project directory)
```shell
# alias projectBuilder="make -C ~/.Gscript/project_template_builder"
fucntion projectBuilder(){
      cp ~/.GScript/project_template_builder/Makefile \
         ~/.GScript/project_template_builder/requirements.txt \
         ~/.GScript/project_template_builder/constructProject.sh \
         ~/.GScript/project_template_builder/cleaningScript.sh . 2>/dev/null && make
  }

```

