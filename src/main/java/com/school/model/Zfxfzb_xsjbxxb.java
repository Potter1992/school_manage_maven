package com.school.model;

import java.util.List;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.ext.plugin.tablebind.TableBind;

public class Zfxfzb_xsjbxxb extends Model<Zfxfzb_xsjbxxb> {
	public static final String TableName = "xsjbxxb";
	public static final Zfxfzb_xsjbxxb me = new Zfxfzb_xsjbxxb();

	public List<Zfxfzb_xsjbxxb> findAll() {
		return Zfxfzb_xsjbxxb.me.find("select * from "+TableName);
	}
	public List<Zfxfzb_xsjbxxb> findByArgs(String para) {
		return Zfxfzb_xsjbxxb.me
				.find("select * from "+TableName+"  where zymc like '%"
						+ para + "%'");
	}
	public List<Zfxfzb_xsjbxxb> findWithValidate(String s_no,String s_password) {
		List<Zfxfzb_xsjbxxb> studentList=Zfxfzb_xsjbxxb.me
		.find("select * from "+TableName+"  where xh = ? && xsmm = ?",s_no,s_password);
		if (studentList==null) {
			return null;
		}
		return studentList;
	}
}
