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
        body {
            background-image: url(/static/img/global_bg.png);
            background-repeat:no-repeat; 
            background-attachment:fixed;
            background-position: center center;
            background-size: 100% 100%;
        }
        .container {
            position: relative;
            min-height: 100%;
            padding-bottom: 80px;
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
      
        .footer {
            border: none;
            height: 30px;
            margin: 10px auto;
            background-image: url(/static/img/yeqian_bg.png);
            background-repeat:no-repeat; 
            background-position: center center;
            background-size: 100% 100%;
            color: #646666;
        }
        .scroll_tabs_theme_light div.scroll_tab_inner span, .scroll_tabs_theme_light div.scroll_tab_inner li {
            line-height: 30px;
        }
        .scroll_tabs_theme_light div.scroll_tab_inner span, .scroll_tabs_theme_light div.scroll_tab_inner li {
            border: 0px;
        }
        .scroll_tabs_theme_light div.scroll_tab_inner span.tab_selected, .footer .scroll_tabs_theme_light div.scroll_tab_inner li.tab_selected {
            border: 14px solid;
            padding: 0 6px; /* 15 + 5  =20 */
            border-image: url(/static/img/yeqian_select.png) 0 14 0 14 fill repeat stretch;
            border-image-outset:3px 5px 3px 5px;
            border-top: 0px;
            border-bottom: 0px;
            color: #7e622c;
        }


        .scroll_tabs_theme_light div.scroll_tab_inner span, .scroll_tabs_theme_light div.scroll_tab_inner li {
            background-color: transparent !important;
        }
        .scroll_tabs_container div.scroll_tab_inner span, .scroll_tabs_container div.scroll_tab_inner li {
            background-color: transparent !important;
        }
        
        .scroll_tabs_theme_light .scroll_tab_right_button::before {
            content: "";
        }
        .scroll_tabs_container .scroll_tab_right_button::before {
            content: "";
        }
        .scroll_tabs_theme_light .scroll_tab_left_button::before {
            content: "";
        }
        .scroll_tabs_container .scroll_tab_left_button::before {
            content: "";
        }
        .scroll_tabs_theme_light .scroll_tab_right_button {
            border: none;
        }
        .scroll_tabs_theme_light .scroll_tab_left_button {
            border: none;
        }
        .ann_title {
            background-image: url(/static/img/title_bg.png);
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-position: center center;
        }

        .scroll_tabs_theme_light div.scroll_tab_inner span, .scroll_tabs_theme_light div.scroll_tab_inner li {
            font-size: 19px;
        }
        .scroll_tabs_container div.scroll_tab_inner span, .scroll_tabs_container div.scroll_tab_inner li {
            font-size: 19px;
        }
        .ann_type {
            display: inline-block;
            background-color: #5e5e5e;
            color: #71dfd8;
            text-align: center;
            height: 30px;
            line-height: 30px;
            text-decoration: none;
        }
        .ann_type.selected {
            background-color: #7ce4dc;
            color: #000;
        }
    </style>
</head>
<body>
    <div class="container">
        {{range $key, $ann := .anns }}
        <div id="ann-{{$ann.ID}}" class="tab-item" {{if ne $key 0}}style="display: none;"{{end}}>
            <div style="position: sticky; top: 0; z-index: 999; background-color: #eee;">
                <img src={{$ann.Pic | url}} style="width: 100%;">
                <div style="text-align: center; font-size: 22px;  width: 70%; margin: 0 auto; color: #71dfd8; padding: 6px 0;">
                    <span style="display:block; height: 30px; line-height: 30px;" class="ann_title">{{$ann.Title}}</p>
                </div>
            </div>
            <div style="padding: 0 20px;" >
                <div style="font-family: 'Microsoft Yahei'; color: #3f3f3f; font-size: 19px;">
                    {{$ann.Content | htmlSafe}}
                </div>
                {{range $annID, $subContentList := $.annSubContent}}
                {{if eq $annID $ann.ID}}
                    {{range $key1, $subContent := $subContentList}}
                        <p style="font-size: 21px; color: #c49c4e; border-left: #c49c4e 3px solid; padding-left: 7px;">{{$subContent.Title}}</p>
                        <div  style="font-family: 'Microsoft Yahei'; color: #3f3f3f; font-size: 19px;background-color: #8888884d;border-radius: 5px;padding: 1px 15px;">
                            {{$subContent.Content | htmlSafe}}
                        </div>
                    {{end}}
                {{end}}
                {{end}}
            </div>
            
        </div>

        {{end}}
            

        <div style="position: fixed; height: 80px; width: 100%; bottom: 0; z-index: 999; background-color: #eee;">
            <div id="tabSet" class="scroll_tabs_theme_light footer"  style="width: 80%;">
                {{range $key, $ann := .anns }}
                <span rel="ann-{{$ann.ID}}" {{if eq $key 0}}class="tab_selected"{{end}}>{{$ann.Label}}</span>
                {{end}}
            </div>
            <div style="font-family: 'Microsoft Yahei';font-size: 20px;display: flex;">
                {{range $key, $annType := .annTypes }}
                <a class="ann_type {{if eq $annType.Identity $.typeIdentity}}selected{{end}}" style='width: {{map_get $.annTypesWidth $annType.Identity}}%;' href="/ann/listann?identity={{$annType.Identity}}">{{$annType.Name}}</a>
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

