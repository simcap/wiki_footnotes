defmodule ParserTest do
  use ExUnit.Case

  import WikiFootnotes.Parser

  test "collect anchor href" do
    parsed = run(html_data)
    assert length(parsed) == 3
  end

  defp html_data do
    """
    <ol class="references">
      <li id="cite_note-1">
        <span class="mw-cite-backlink">
          <b>
            <a href="#cite_ref-1"><span class="cite-accessibility-label">Jump up </span>^</a>
          </b>
        </span>
        <span class="reference-text">Longman Pronunciation Dictionary. 3rd Ed. 2008.<br>
          <a rel="nofollow" class="external text" href="http://www.merriam-webster.com/dictionary/crêpe">Merriam-Webster Dictionary</a>
        </span>
      </li>
      <li id="cite_note-4"><span class="mw-cite-backlink">
        <b>
          <a href="#cite_ref-4">
            <span class="cite-accessibility-label">Jump up </span>^</a>
          </b>
        </span>
        <span class="reference-text">Courtine, Robert J. (1984), <i>Larousse gastronomique</i> (French edition), Paris: Librairie Larousse.</span>
      </li>
      <li id="cite_note-5">
        <span class="mw-cite-backlink">
          <b>
            <a href="#cite_ref-5"><span class="cite-accessibility-label">Jump up </span>^</a>
          </b>
        </span>
          <span class="reference-text">Pancake House (2007). "Cherry Kijafa Crepes"; retrieved from <a rel="nofollow" class="external free" href="http://www.originalpancakehouse.com/phm_crepes2.html">http://www.originalpancakehouse.com/phm_crepes2.html</a>.
          </span>
        </li>
      <li id="cite_note-9">
        <span class="mw-cite-backlink">
          <b>
            <a href="#cite_ref-9"><span class="cite-accessibility-label">Jump up </span>^</a>
          </b>
        </span>
        <span class="reference-text">Fernández-del-Villar, Miguel Angel and Ruiz-Naufal, Víctor M., <i>Mesa Mexicana</i> (1993), Fundación Cultural Bancomer, <a href="/wiki/Special:BookSources/9789686084948" class="internal mw-magiclink-isbn">ISBN 9789686084948</a>
        </span>
      </li>
      <li id="cite_note-10">
        <span class="mw-cite-backlink"><b><a href="#cite_ref-10"><span class="cite-accessibility-label">Jump up </span>^</a></b></span> <span class="reference-text"><a rel="nofollow" class="external free" href="http://www.mexconnect.com/articles/2139-the-french-influence-on-mexican-cooking-la-comida-afrancescada">http://www.mexconnect.com/articles/2139-the-french-influence-on-mexican-cooking-la-comida-afrancescada</a></span>
      </li>
    </ol>
    """
  end

end
