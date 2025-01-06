# Nanami's Surge Profile

This profile is very subjective. Please modify it to meet your requirements.

## Usage

This project is using `surgio`. Documents can be found [here](https://surgio.js.org/guide.html)

### Generate

```bash
pnpm install
pnpm dlx surgio generate
```

### Dotenv

`surgio` does not support dotenv. So you need to add

```js
require('dotenv').config()
```

manually in every file in `provider` directory.

### Filter

I wrote custom filters to filter nodes in Hong Kong and the United States. These filters are based on country flag emojis only. Please change filter or make sure your nodes' names contain flag emojis.

### Config

**PLEASE** modify `surgio.conf.js` and all files under `provider` directory to meet your need. Please read documents on [surgio.js.org](https://surgio.js.org/guide.html).
