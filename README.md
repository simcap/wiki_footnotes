# WikiFootnotes

Listing http links footnotes of a Wikipedia page from your command line

# Install

* Install Erlang or Elixir (`brew install elixir` will get you both)
* Get the binary executable with


    $ wget //raw.githubusercontent.com/simcap/wiki_footnotes/master/wiki_footnotes
    $ chmod +x wiki_footnotes

# Usage

From the command line enter a topic

    $ ./wiki_footnotes elixir         # To get footnotes on the Elixir language
    $ ./wiki_footnotes thomas paine   # To get footnotes on the great Thomas Paine

... or straight from a url

    $ ./wiki_footnotes http://en.wikipedia.org/wiki/Elixir

You will get a readable listing of all http links from the page's footnotes