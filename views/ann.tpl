<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公告</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">

    <link rel="stylesheet" href="/static/css/scrolltabs.css">

    <style>
        
        @font-face {
            font-family: "SimHei";
            src: url(/static/font/simhei.ttf);
        }
        @font-face {
            font-family: "HYLing";
            src: url(/static/font/HYLingXinClassic75W.ttf);
        }
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
        a, a:hover, a:visited, a:link, a:active , a:focus, div.scroll_tab_inner {
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0); /*解决手机版点击背景问题*/
        }
        .container {
            position: relative;
            min-height: 100%;
            /* padding-bottom: 20.6vw; */
            padding-bottom: 12.3vw;
        }
        .container p {
            margin: 0;
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
            height: 7vw;
            margin: 2.27vw auto 3.03vw;
            background-image: url(/static/img/yeqian_bg.png);
            background-repeat:no-repeat; 
            background-position: center center;
            background-size: 100% 100%;
            color: #646666;
            border-radius: 4vw 0 4vw 0;
            overflow: hidden;
        }
        .scroll_tabs_theme_light div.scroll_tab_inner {
            height: 7vw;
            -webkit-overflow-scrolling: touch;
            overflow-x: scroll !important;
            cursor: pointer;
            /* margin: 0 0 0 0.7vw !important; */
        }
        div.scroll_tab_inner {
            scrollbar-width: none; /* For Firefox */
            -ms-overflow-style: none; /* For Internet Explorer and Edge */
        }

        div.scroll_tab_inner::-webkit-scrollbar {
            width: 0px; /* For Chrome, Safari, and Opera */
            height: 0px;;
            display: none;
        }
        #tabSet span:nth-child(2) {
            margin-right: -1.5vw;
            margin-left: 0;
        }
        #tabSet span:nth-last-child(2) {
            margin-left: -1.5vw;
            margin-right: 0;
        }
        #tabSet span{
            margin-left: -0.7vw;
            margin-right: -0.7vw;
        }
       

        .scroll_tabs_theme_light div.scroll_tab_inner span,
        .scroll_tabs_container div.scroll_tab_inner span {
            padding-left: 17px;
            padding-right: 17px;
        }
      

        .scroll_tabs_theme_light div.scroll_tab_inner span, .scroll_tabs_theme_light div.scroll_tab_inner li {
            line-height: 7vw;
        }
        .scroll_tabs_theme_light div.scroll_tab_inner span, .scroll_tabs_theme_light div.scroll_tab_inner li {
            border: 0px;
        }
        .scroll_tabs_theme_light div.scroll_tab_inner span.tab_selected, .footer .scroll_tabs_theme_light div.scroll_tab_inner li.tab_selected {
            border: 17px solid;
            padding: 0 0px; 
            border-image: url(/static/img/yeqian_select.png) 0 17 0 17 fill repeat stretch;
            border-image-outset:0.55vw 0.94vw 0.55vw 0.94vw;
            /* border-image-outset:0.55vw 0.3vw 0.55vw 0.3vw; */
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
            font-size: 3.59vw;
        }
        .scroll_tabs_container div.scroll_tab_inner span, .scroll_tabs_container div.scroll_tab_inner li {
            font-size: 3.59vw;
        }
        .ann_type {
            display: inline-block;
            background-color: #5e5e5e;
            color: rgba(113, 223, 217, 0.7);
            text-align: center;
            height: 8.3vw;
            line-height: 8.3vw;
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
            <div style="position: sticky; top: 0; z-index: 999; background-image: url(/static/img/global_bg.png);background-size: 100vw 100vh;">
                {{if ne $ann.Pic ""}}<img src={{$ann.Pic | url}} style="display:block;margin: 0 auto; padding-top: 1.89vw; width: 94%;">{{end}}
                <div style="text-align: center; font-size: 4.15vw;  width: 70%; margin: 0 auto; color: #71dfd8; padding: 3.21vw 0;">
                    <span style="display:block; line-height: 7.2vw; height: 7.2vw; font-family: 'HYLing'" class="ann_title">{{$ann.Title}}</p>
                </div>
            </div>
            <div style="padding: 0 3.77vw;" >
                <div style="font-family: 'SimHei'; color: #3f3f3f; font-size: 3.59vw; line-height: 5.66vw">
                    {{$ann.Content | htmlSafe}}
                </div>
                {{range $annID, $subContentList := $.annSubContent}}
                {{if eq $annID $ann.ID}}
                    {{range $key1, $subContent := $subContentList}}
                        <p style="font-size: 3.96vw; color: #c49c4e; font-family: 'HYLing'; margin: 3.77vw 0 1.89vw 0">
                            <img src="/static/img/subtitle_start.png" style="width: 0.76vw; height: 3.25vw; line-height: 3.96vw;">
                            {{$subContent.Title}}
                        </p>
                        <div  style="padding: 0; line-height: 4.9vw; font-family: 'SimHei'; color: #3f3f3f; font-size: 3.59vw;background-color: #9999994d;border-radius: 1vw;padding: 2vw;">
                            {{$subContent.Content | htmlSafe}}
                        </div>
                    {{end}}
                {{end}}
                {{end}}
            </div>
            
        </div>

        {{end}}
            

        <div style="position: fixed; height: 12.3vw; width: 100%; bottom: 0; z-index: 999; background-color: #eee;">
            <div id="tabSet" class="scroll_tabs_theme_light footer"  style="width: 55%;font-family: 'HYLing';">
                {{range $key, $ann := .anns }}
                <span rel="ann-{{$ann.ID}}" {{if eq $key 0}}class="tab_selected"{{end}}>{{$ann.Label}}</span>
                {{end}}
            </div>
            <!-- <div style="font-family: 'HYLing';font-size: 3.78vw;display: flex;">
                {{range $key, $annType := .annTypes }}
                <a class="ann_type {{if eq $annType.Identity $.typeIdentity}}selected{{end}}" style='width: {{map_get $.annTypesWidth $annType.Identity}}%;' href="/ann/listann?identity={{$annType.Identity}}">{{$annType.Name}}</a>
                {{end}}
            </div> -->
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

