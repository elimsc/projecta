package controllers

import (
	"projecta/models"
	"time"

	"github.com/beego/beego/v2/adapter/orm"
	"github.com/beego/beego/v2/server/web"
)

type AnnController struct {
	web.Controller
}

func (c *AnnController) ListAnn() {
	annTypeIdentity := c.GetString("identity")
	now := time.Now().Unix()

	o := orm.NewOrm()

	var anns []*models.Ann
	o.QueryTable(&models.Ann{}).
		Filter("type", annTypeIdentity).
		Filter("start_time__lte", now).
		Filter("end_time__gte", now).
		OrderBy("order").
		All(&anns)

	var annIds []int
	for _, ann := range anns {
		annIds = append(annIds, ann.ID)
	}

	var subContentList []*models.AnnSubContent
	o.QueryTable(&models.AnnSubContent{}).
		Filter("ann_id__in", annIds).
		Filter("start_time__lte", now).
		Filter("end_time__gte", now).
		OrderBy("ann_id", "order").
		All(&subContentList)

	var annSubContent = map[int][]*models.AnnSubContent{}
	for _, subContent := range subContentList {
		annSubContent[subContent.AnnID] = append(annSubContent[subContent.AnnID], subContent)
	}

	c.Data["anns"] = anns
	c.Data["annSubContent"] = annSubContent

	c.Data["content"] = "world"
	c.TplName = "ann.tpl"
}
