package models

import "github.com/beego/beego/v2/adapter/orm"

type Ann struct {
	ID        int    `orm:"column(id)"`
	Pic       string `orm:"column(pic)"`
	Title     string `orm:"column(title)"`
	Label     string `orm:"column(label)"`
	Content   string `orm:"column(content)"`
	Type      string `orm:"column(type)"`
	Order     int    `orm:"column(order)"`
	StartTime int64  `orm:"column(start_time)"`
	EndTime   int64  `orm:"column(end_time)"`
}

func (m *Ann) TableName() string {
	return "projecta_ann"
}

type AnnType struct {
	ID       int    `orm:"column(id)"`
	Identity string `orm:"column(identity)"`
	Name     string `orm:"column(name)"`
}

func (m *AnnType) TableName() string {
	return "projecta_ann_type"
}

type AnnSubContent struct {
	ID        int    `orm:"column(id)"`
	Title     string `orm:"column(title)"`
	Content   string `orm:"column(content)"`
	Order     int    `orm:"column(order)"`
	AnnID     int    `orm:"column(ann_id)"`
	StartTime int64  `orm:"column(start_time)"`
	EndTime   int64  `orm:"column(end_time)"`
}

func (m *AnnSubContent) TableName() string {
	return "projecta_ann_subcontent"
}

func init() {
	orm.RegisterModel(new(Ann), new(AnnType), new(AnnSubContent))
}
