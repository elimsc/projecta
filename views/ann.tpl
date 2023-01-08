<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">

    <link rel="stylesheet" href="/static/css/scrolltabs.css">

    <style>
        html {
            height: 100%;
        }
        .container {
            position: relative;
            min-height: 100%;
            padding-bottom: 42px;
        }
        body{
            background-color: #eee;
        }
        .scroll_tab_left_finisher {
            display: none !important;
        }
        .scroll_tab_right_finisher {
            display: none !important;
        }
        .scroll_tabs_container {
            text-align: center !important;
        }
        .scroll_tab_inner {
            min-width: 100%;
            background-color: #CCCCCC;
        }
        .scroll_tabs_theme_light div.scroll_tab_inner span, .scroll_tabs_theme_light div.scroll_tab_inner li {
            border: none !important;
        }
    </style>
</head>
<body>
    <div class="container">
        {{range $key, $ann := .anns }}
        <div id="ann-{{$ann.ID}}" class="tab-item" {{if ne $key 0}}style="display: none;"{{end}}>
            <div style="position: sticky; top: 0; z-index: 999; background-color: #eee;">
                <img src={{$ann.Pic | url}} style="width: 100%;">
                <p style="text-align: center; font-size: 24px; height: 40px; line-height: 40px; margin: 0; color: #71dfd8;">{{$ann.Title}}</p>
            </div>
            <div style="padding: 0 10px;" >
                {{$ann.Content | htmlSafe}}
                {{range $annID, $subContentList := $.annSubContent}}
                {{if eq $annID $ann.ID}}
                    {{range $key1, $subContent := $subContentList}}
                        <p style="font-size: 20px; color: #c49c4e; border-left: #c49c4e 3px solid; padding-left: 5px;">{{$subContent.Title}}</p>
                        {{$subContent.Content | htmlSafe}}
                    {{end}}
                {{end}}
                {{end}}
            </div>
            
        </div>
        {{end}}
        
    
            

        <div style="position: fixed; height: 42px; width: 100%; bottom: 0; z-index: 999; background-color: #eee;">
            <div id="tabSet" class="scroll_tabs_theme_light">
                {{range $key, $ann := .anns }}
                <span rel="ann-{{$ann.ID}}" >{{$ann.Label}}</span>
                {{end}}
            
            </div>
        </div>
    </div>

    

    <!-- <script src="/static/js/jquery-3.6.3.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="/static/js/jquery.scrolltabs.js"></script>
    <script src="/static/js/jquery.mousewheel.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
    <script>

        $( function() {
            $( "#tabs" ).tabs();
        } );
        $('#tabSet').scrollTabs({
            left_arrow_size: 0, 
            right_arrow_size: 0,
            click_callback: function(e){
                var val = $(this).attr('rel');
                $('.tab-item').hide()
                $('#' + val).show()
            }
        });
    </script>
</body>
</html>

