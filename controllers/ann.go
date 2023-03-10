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

	var annTypes []*models.AnnType
	o.QueryTable(&models.AnnType{}).OrderBy("-id").All(&annTypes)

	var annTypesWidth = map[string]int{}
	width := 100 / len(annTypes)
	lastWidth := 100 - width*len(annTypes) + width // 100 - 33 * 3 + 33 = 34
	for i, annType := range annTypes {
		if i == len(annTypes)-1 {
			annTypesWidth[annType.Identity] = lastWidth
		} else {
			annTypesWidth[annType.Identity] = width
		}
	}

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
	if len(annIds) > 0 {
		o.QueryTable(&models.AnnSubContent{}).
			Filter("ann_id__in", annIds).
			Filter("start_time__lte", now).
			Filter("end_time__gte", now).
			OrderBy("ann_id", "order").
			All(&subContentList)
	}

	var annSubContent = map[int][]*models.AnnSubContent{}
	for _, subContent := range subContentList {
		annSubContent[subContent.AnnID] = append(annSubContent[subContent.AnnID], subContent)
	}

	c.Data["anns"] = anns
	c.Data["annSubContent"] = annSubContent
	c.Data["typeIdentity"] = annTypeIdentity
	c.Data["annTypes"] = annTypes
	c.Data["annTypesWidth"] = annTypesWidth

	c.TplName = "ann.tpl"
}
