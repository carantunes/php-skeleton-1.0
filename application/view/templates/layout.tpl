<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="ISO-8859-1">
        <title>{block name=title}Mini App{/block}</title>
        {block name=head}{/block}
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- JS -->
        <!-- jQuery, loaded in the recommended protocol-less way -->
        <!-- more http://www.paulirish.com/2010/the-protocol-relative-url/ -->
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <!-- define the project's URL (to make AJAX calls possible, even when using this in sub-folders etc) -->
        <script>
            var url = "{$URL}";
        </script>

        <!-- our JavaScript -->
        <script src="/js/application.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="/styles/styles.php/styles.scss" />

    </head>
    <body>
        <!-- logo -->
        <div class="logo">
            MINI
        </div>

        <!-- navigation -->
        <div class="navigation">
            <a href="/">home</a>
            <a href="/home/exampleone">subpage</a>
            <a href="/home/exampletwo">subpage 2</a>
            <a href="/songs">songs</a>
        </div>

        {block name=body}{/block}

    </body>
</html>
