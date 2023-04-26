<h1>
    <p align="center">🚀 SkyRocket (Versioning)</p>
</h1>

## 🎵 Introduction

> **A simple script to update your package version with git commit!**

This script helps you manage `package.json` version in your project.

If you want to increase (or decrease) the version after completing the implementation in your project, run this script. The version would be updated, and the updates are committed by writing a commit message from you. Now, you just have to 'push' your project to the remote repository!

## 🚨 Prerequisites

> This script is used for JS/TS project.

-   You should be able to use the `node` command from [here](https://nodejs.org/en).
-   You should be able to use the `git` command from [here](https://git-scm.com/).

## 💡 Setup

> If your project already exists, just accompany `skyrocket.sh` script and a few settings below.

First of all, you can clone this repository or just copy the `skyrocket.sh` script into your project.

```bash
$ git clone https://github.com/hubts/version-skyrocket
```

Set `package.json` as the following:

```bash
"scripts": {
    "git": "./script/skyrocket.sh"
},
```

Then, install dev-dependencies for git commit using `commitizen`:

```bash
$ yarn add --dev commitizen cz-emoji-conventional
```

**(Optional)** You can set configurations for the commitizen in `package.json`:

```bash
"config": {
    "commitizen": {
        "path": "cz-emoji-conventional",
        "disableScopeLowerCase": true,
        "disableSubjectLowerCase": true
    }
}
```

Now, your `package.json` looks like after the setting and installation:

```bash
{
    "name": "version-skyrocket",
    "version": "0.0.4-0",
    "description": "A script to update your package version with git commit",
    "main": "index.js",
    "repository": "https://github.com/hubts/version-skyrocket.git",
    "author": "@hubts",
    "license": "MIT",
    "scripts": {
        "git": "./script/skyrocket.sh"
    },
    "devDependencies": {
        "commitizen": "^4.3.0",
        "cz-emoji-conventional": "^1.0.1"
    },
    "config": {
        "commitizen": {
            "path": "cz-emoji-conventional",
            "disableScopeLowerCase": true,
            "disableSubjectLowerCase": true
        }
    }
}

```

## ⛳️ Usage

The `git` script in `package.json` runs the `skyrocket.sh` script.

Run this command in your root directory:

```bash
$ yarn git [version] [path?]
```

-   `[version]` : set a new version
    -   `x.x.x` : change as the specific version (e.g. `1.0.1`, `2.3.0-1`, and so on)
    -   `major` : increase major version (e.g. `0.0.1` >> `1.0.0`)
    -   `minor` : increase minor version (e.g. `0.0.1` >> `0.1.0`)
    -   `patch` : increase patch version (e.g. `0.0.1` >> `0.0.2`)
    -   `premajor` : increase as major pre-version (e.g. `1.0.0` >> `2.0.0-0`)
    -   `preminor` : increase as minor pre-version (e.g. `0.1.0` >> `0.2.0-0`)
    -   `preptach` : increase as patch pre-version (e.g. `0.0.1` >> `0.0.2-0`)
    -   `prerelease` : increase as release pre-version (e.g. `0.0.2-0` >> `0.0.2-1`)
-   `[path?]` : path of `package.json`
    -   In default, the current path (pwd) would be used. If you run the script in your project root directory, you can use this as empty.

**Example**

I want to update the version as patch in root directory:

```bash
$ yarn git patch
```

I want to update the version as 0.0.3 in force with `./api` directory:

```bash
$ yarn git 0.0.3 ./api
```

In this case, `package.json` must be located in `api` directory.

After updating the version, git commit will be proceed. The script uses `commitizen` for git commit, so you should enter the information of your commitment.

## 🖼️ Example GIF

<img src="https://user-images.githubusercontent.com/25478540/234499779-f061ee9d-a7d9-472b-82a8-64c91e33b101.gif" />
