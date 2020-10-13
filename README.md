[_Jest_] + [CoffeeScript]
=========================
Easily write your [_Jest_]s in CoffeeScript.

Automatically handles [_transform_]ation, including even tests written in _[literate]_ CoffeeScript.

This will work on any `.`\[[`lit`]\][`coffee`]\[[`.md`]\] file in your `test`/`spec`[`s`] folder by default.

Install
-------
Assuming you already have `npm` [setup] to work with GitHub Packages:
~~~ sh
npm config set @danielbayley:registry https://npm.pkg.github.com
npm install @danielbayley/jest-preset-coffeescript --save-dev
~~~
Then add the following to your `package.json`:
~~~ json
"jest": {
  "preset": "@danielbayley/jest-preset-coffeescript"
},
~~~

License
-------
[MIT] © [Daniel Bayley]

[MIT]:              LICENSE.md
[Daniel Bayley]:    https://github.com/danielbayley

[_jest_]:           https://facebook.github.io/jest
[_transform_]:      https://facebook.github.io/jest/docs/en/configuration.html#transform-object-string-string

[coffeescript]:     http://coffeescript.org
[literate]:         http://coffeescript.org/#literate

[`lit`]:            test/index.litcoffee
[`coffee`]:         test/index.coffee
[`.md`]:            test/index.coffee.md

[setup]:            https://help.github.com/packages/using-github-packages-with-your-projects-ecosystem/configuring-npm-for-use-with-github-packages#authenticating-to-github-package-registry
