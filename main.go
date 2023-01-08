package main

import (
	"html/template"
	_ "projecta/routers"

	"github.com/beego/beego/v2/client/orm"
	beego "github.com/beego/beego/v2/server/web"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	orm.RegisterDataBase("default", "mysql", "root:@tcp(127.0.0.1:3306)/gm?charset=utf8")
}

func htmlSafe(html string) template.HTML {
	return template.HTML(html)
}

func url(url string) template.URL {
	return template.URL(url)
}

func main() {
	beego.SetStaticPath("/static", "static")
	beego.AddFuncMap("htmlSafe", htmlSafe)
	beego.AddFuncMap("url", url)
	beego.Run()
}
