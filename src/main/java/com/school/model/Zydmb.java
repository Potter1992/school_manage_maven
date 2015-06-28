package com.school.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Zydmb extends Model<Zydmb> {
	public static final String TableName = "zydmb";
	public static final Zydmb me = new Zydmb();

	/**
	 * 
	 * @return 专业代码表
	 */
	public List<Zydmb> findAll() {

		return find("select * from " + TableName);
	}

	public List<Zydmb> findByAcademy(String para) {
		Xydmb xydmb = Xydmb.me.dm(para);
		return find("select * from " + TableName + "  where ssxydm =  ? ",
				xydmb.get("xydm"));
	}

	/**
	 * 根据获得的专业和相应的学院获得专业代码
	 */
	public String getZydm(String academy, String subject) {
		// 通过学院名称获得学院代码
		String xydm_perString = Xydmb.me.findByAcademyName(academy);
		String subString=subject.replaceAll(" ", "");
		List<Zydmb> zyList=findAll();
		Zydmb zydmbs=findFirst("select * from zydmb where ssxydm='1001' and zymc=?",subString);
		List<Zydmb> zydmb = find("select * from " + TableName
				+ " where ssxydm=? and zymc='"+subString+"'", xydm_perString.toString().trim());
		return zydmb.get(0).getStr("zydm");
	}
	/**
	 * 根据获得的专业和相应的学院获得专业代码
	 */
	public String findByacademyAndSubject (String academy,String subject) {
		String xydm_perString = Xydmb.me.findByAcademyName(academy);
		subject=subject.replaceAll(" ", "");
		return findFirst("select * from "+TableName+" where ssxydm = ? and zymc = ?", xydm_perString,subject).get("zydm");
	}
	/**
	 * 根据专业代码获得学历
	 */
	public String getZydmCC(String zydm) {
		if (zydm != null) {
			Zydmb zydmb = Zydmb.me.findFirst("select * from " + TableName
					+ " where zydm = ?", zydm);
			return zydmb.get("cc");
		} else {
			return null;
		}

	}
}
