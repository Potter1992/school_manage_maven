package com.school.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
/*
 * 审批人
 */
public class Approve_person extends Model<Approve_person> {
	public static final String TableName = "approve_person";
	public static final String TableName_Role = "role";
	public static final Approve_person me=new Approve_person();
	/**
	 * 审核人员根据r_id获取审核人员的角色名称
	 */
	public List findListByr_id() {
		String sqlString="select * from "+TableName+" as a, "+TableName_Role+" as b where a.r_id=b.r_id ";
		List list=find(sqlString);
		return list;
	}
	/**
	 * 分页
	 */
	public Page<Approve_person> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", " from "+TableName+" as a ,role as b where a.r_id=b.r_id order by a_id asc");
	}
	/**
	 *根据账号查看是否存在 
	 */
	public boolean accountIsExited(String account) {
		Approve_person person=Approve_person.me.findFirst("select * from "+TableName+" where a_account = ?", account);
		if (person!=null) {
			return true;
		}
		return false;
		
	}
	/**
	 * 查找所有的审核人
	 * @return
	 */
	public List<Approve_person> findAll() {
		
		return Approve_person.me.find("select * from "+TableName);
	}
	/**
	 * 根据用户名密码登陆审核人
	 * @param username
	 * @param password
	 * @return
	 */
	public Approve_person findByLogin(String username,String password) {
		String sql = "select * from  "+TableName+"    where a_account= ? && a_password = ? ";
		List<Approve_person> list = Approve_person.me.find(sql, username,
				password);
		if (list.size()!=0) {
			Approve_person app=list.get(0);
			return app;
		}
		return null;
	}
	public List<Approve_person> getCurrentApprove_person(String username,String password) {
		String sql = "select * from  "+TableName+"    where a_account= ? && a_password = ? ";
		List<Approve_person> list = Approve_person.me.find(sql, username,
				password);
		return list;
	}
	/**
	 * 通过审核人id获得审核人层次
	 * 
	 * @param a_id
	 * @return
	 */
	public List<Approve_person> findA_typeByA_id(int a_id) {
		 List<Approve_person> approve_person=find("select  *  from" + TableName + " where a_id = ?", a_id);
		if (approve_person.size()==0) {
			return null;
		}else {
			return approve_person;
		}
		
	}
}
