[_Jest_] + [CoffeeScript]
=========================
Easily write your [_Jest_]s in CoffeeScript.

Automatically handles [_transform_]ation, including even tests written in _[literate]_ CoffeeScript.

This will work on any `.`\[[`lit`]\][`coffee`]\[[`.md`]\] file in your `test`/`spec`[`s`] folder by default.

Install
-------
Assuming you already:
1. [configured] `npm` to work with GitHub Packages
2. `install`ed [`peerDependencies`]
~~~ sh
npm config set @danielbayley:registry https://npm.pkg.github.com
npm install @danielbayley/jest-preset-coffeescript --save-dev
~~~
Then add the following to your Jest [configuration]:
~~~ js
// package.json
"jest": {
  "preset": "@danielbayley/jest-preset-coffeescript"
},
~~~

License
-------
[MIT] © [Daniel Bayley]

[MIT]:                LICENSE.md
[Daniel Bayley]:      https://github.com/danielbayley

[_jest_]:             https://jestjs.io
[configuration]:      https://jestjs.io/docs/configuration
[_transform_]:        https://jestjs.io/docs/en/configuration#transform-objectstring-pathtotransformer--pathtotransformer-object

[coffeescript]:       http://coffeescript.org
[literate]:           http://coffeescript.org/#literate

[`lit`]:              test/index.litcoffee
[`coffee`]:           test/index.coffee
[`.md`]:              test/index.coffee.md

[configured]:         https://help.github.com/packages/using-github-packages-with-your-projects-ecosystem/configuring-npm-for-use-with-github-packages#authenticating-to-github-package-registry
[`peerDependencies`]: https://docs.npmjs.com/files/package.json#peerdependencies
