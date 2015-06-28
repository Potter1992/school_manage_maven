package com.school.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Xydmb extends Model<Xydmb> {
	public static final String TableName ="xydmb";
	public static final Xydmb me = new Xydmb();

	/**
	 * 
	 * @return 专业代码表
	 */
	public List<Xydmb> findAll() {
		
		return find("select * from "+TableName);
	}
	/**
	 * 
	 * 通过学院名称获得代码
	 */
	public String findByAcademyName(String name) {
		if (name!=null) {
			Xydmb xydmb=findFirst("select * from "+TableName+"  where xymc = ?", name);
			if (xydmb==null) {
				return null;
			}else {
				return xydmb.get("xydm");
			}	
		}else {
			return null;
		}
		
		
		
	}
	/**
	 * 
	 */
	public Xydmb dm(String para) {
		Xydmb xydmb = Xydmb.me.find(
				"select * from "+TableName+" where xymc like '%" + para + "%'").get(0);
		return xydmb;
	}

}
