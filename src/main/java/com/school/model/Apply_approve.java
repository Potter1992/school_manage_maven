package com.school.model;

import java.util.ArrayList;
import java.util.List;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class Apply_approve extends Model<Apply_approve> {
	/**
	 * 
	 */
	public static final String TableName = "apply_approve";
	public static final Apply_approve me = new Apply_approve();

	/**
	 * 通过审核人审核后,进行更新数据库
	 * 
	 * @param sno
	 * @return
	 */
	public boolean agree(String sno) {
		Apply_approve apply_approve = findFirst("select * from " + TableName
				+ "  where s_no = ?", sno);
		int step = apply_approve.get("aa_current_step");
		Db.update("update " + TableName
				+ " set aa_current_step = ? where s_no = ?", step + 1, sno);
		return true;

	}

	/**
	 * 通过审核人的顺序获得审核申请记录,以便不同审核人查看
	 * 
	 * @param sort
	 * @return
	 */
	public List<Apply_approve> findByCurrent_step(int sort) {
		return find("select * from " + TableName + " where aa_current_step = "
				+ sort);
	}

	/**
	 * 通过审核人的顺序获得审核申请记录,以便不同审核人查看
	 * 
	 * @param sort
	 * @return
	 */
	public List<Apply_approve> findByCurrent_stepCut(int sort) {
		return find("select * from " + TableName + " where aa_current_step= "
				+ sort);
	}

	/**
	 * 通过学号获得审核申请记录,以便学生查看
	 * 
	 * @param s_no
	 * @return
	 */
	public Apply_approve findByS_no(String s_no) {
		return find("select * from " + TableName + " where s_no = " + s_no)
				.get(0);
	}

	/**
	 * 通过学院得到学院的信息,并通过此学院获得记录
	 * 
	 * @param s_academy
	 * @return
	 */
	public List<Apply_approve> findA_academyAndCurrent_step(String s_academy,
			int sort) {
		List<Student_apply> student_applies = Student_apply.me
				.findByAcademy(s_academy);
		List<Apply_approve> apps = new ArrayList<Apply_approve>();
		for (Student_apply student_apply : student_applies) {
			Apply_approve ee = Apply_approve.me.findByS_no(student_apply
					.getStr("s_no"));
			int nn = ee.getInt("aa_current_step");
			if (nn == sort) {
				apps.add(ee);
			}
		}
		return apps;
	}

	/**
	 * 查找全部的信息
	 * 
	 * @return
	 */
	public List<Apply_approve> findAll() {
		return find("select * from " + TableName);
	}

	/**
	 * 通过record保存申请审核
	 * 
	 * @param record
	 * @return
	 */
	public boolean saveByRecordorUpdate(Record record) {
		String s_noString = record.get("s_no");
		String result = Db.queryStr("select s_no from " + TableName
				+ " where  s_no = ?", s_noString);
		if (result != null) {
			if (Db.update(TableName, "s_no", record)) {
				return true;
			} else {
				return false;
			}
		} else {
			if (Db.save(TableName, record)) {
				return true;
			} else {
				return false;
			}
		}

	}
}
