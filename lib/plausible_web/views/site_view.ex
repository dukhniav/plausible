defmodule PlausibleWeb.SiteView do
  use PlausibleWeb, :view

  def snippet() do
    """
    <script>
      (function (w,d,s,o,f,js,fjs) {
      w[o] = w[o] || function () { (w[o].q = w[o].q || []).push(arguments) };
      js = d.createElement(s), fjs = d.getElementsByTagName(s)[0];
      js.id = o; js.src = f; js.async = 1; fjs.parentNode.insertBefore(js, fjs);
      }(window, document, 'script', 'plausible', 'https://plausible.io/js/p.js'));

      plausible('page')
    </script>\
    """
  end
end
