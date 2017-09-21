Literate CoffeeScript
=====================
This is a literate CoffeeScript file.

~~~ coffee

    import {extname} from 'path'

    describe "Literate CoffeeScript", =>
      it "tranforms #{extname __filename} files", =>
        expect("A spade").toBe "A spade"
~~~
