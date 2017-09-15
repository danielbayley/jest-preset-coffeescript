[_Literate_] CoffeeScript
=========================
This is a [_literate_] CoffeeScript file, written in Markdown.

~~~ coffee

    ext = __filename.split('.')[1..].join '.'

    describe "Literate CoffeeScript", =>
      it "tranforms .#{ext} files", =>
        expect("A spade").toBe "A spade"
~~~

[_literate_]:   http://coffeescript.org/#literate
