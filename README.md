# SINGLETON SD - SCRIPTS - COMMON

This project contains common Linux bash scripts.

> The **main repository** is hosted in [gitlab.com/singletonsd/scripts/common](https://gitlab.com/singletonsd/scripts/common.git) but it is automaticaly mirrored to [github.com/singletonsd](https://github.com/singletonsd/common.git), [github.com/patoperpetua](https://github.com/patoperpetua/scripts-common.git) and to [gitlab.com/patoperpetua](https://gitlab.com/patoperpetua/scripts-common.git). If you are in the Github page it may occur that is not updated to the last version.

## AVAILABLE SCRIPTS

### BASH COMMON

It provides common options to reuse with a binary.

```bash
curl -s https://singletonsd.gitlab.io/scripts/common/latest/bash_common.sh | bash /dev/stdin -b="${BINARY_NAME}"
```

It contains the following options:

```bash
-b | --binary: binary to execute.
-h | --help: display help.
-o | --only: the name of the file or folder to test.
```

It can be downloaded by:

```bash
curl -o bash_common.sh -L https://singletonsd.gitlab.io/scripts/common/latest/bash_common.sh
```

### BASH SCRIPT TEST

It tests bash script file(s) using shellcheck. It depennds on common script, so to use it you need to have both in the same directory. It contains the following options:

```bash
-h | --help: display help.
-o | --only: the name of the file or folder to test.
```

It can be downloaded by:

```bash
curl -o bash_common.sh -L https://singletonsd.gitlab.io/scripts/common/latest/bash_common.sh && \
curl -o bash_script_test.sh -L https://singletonsd.gitlab.io/scripts/common/latest/bash_script_test.sh
```

#### BASH SCRIPT TEST STANDALONE

It is the same script as bash script test but it contains everythin in one file.

It can be downloaded by:

```bash
curl -o bash_script_test_standalone.sh -L https://singletonsd.gitlab.io/scripts/common/latest/bash_script_test_standalone.sh
```

## STRUCTURE

Master branch is setup as latest folder. To use an specific version, put the version name before the file name like:

```url
https://singletonsd.gitlab.io/scripts/common/latest/bash_script_test_standalone.sh
https://singletonsd.gitlab.io/scripts/common/develop/bash_script_test_standalone.sh
https://singletonsd.gitlab.io/scripts/common/v0.0.2/bash_script_test_standalone.sh
```

## DOCUMENTATION

- [Shellcheck](https://github.com/koalaman/shellcheck)

## TODO

- [X] Fix documentation.
- [X] Add script to download test script from gitlab pages.
- [ ] Zip all scripts and put inside pages.

----------------------

© [Singleton SD](http://www.singletonsd.com), Italy, 2019.
