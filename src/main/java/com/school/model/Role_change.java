package com.school.model;

import java.util.List;

import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Model;

public class Role_change extends Model<Role_change> {
	/**
	 * 角色异动关系表
	 */
	public static final String TableName = "role_change";
	public static final String RoleTableName = "role";
	public static final String ChangeTableName = "change_apply";
	public static final Role_change me = new Role_change();
	/**
	 * 删除后,大于rc_sort的记录自动减一
	 */
	public boolean deleteAfter_minus(int rc_sort,int c_id) {
		int count=DbPro.use().update("update  "+TableName+" set rc_sort = rc_sort-1   where rc_sort > ? and c_id = ?",rc_sort,c_id);
		if (count>0) {
            //删除成功后,异动表中也应该总步骤减一
            Change.me.updateSteps_minus(c_id);
			return true;
		}else {
			return false;
		}
	
	}

	/**
	 * 根据c_id和r_id查找到相应的记录
	 */
	public Role_change findByC_idAndR_id(int c_id, int r_id) {

		return findFirst("select * from " + TableName
				+ " where c_id = ? and r_id = ?", c_id, r_id);
	}

	/**
	 * 根据c_id查找角色和异动表的记录
	 * 
	 * @param c_id
	 * @return
	 */
	public List<Role_change> findByC_id(int c_id) {
		List<Role_change> list = find("select * from " + TableName
				+ " where c_id = ?", c_id);
		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	/**
	 * 通过异动id和角色id判断异动关系表中是否存在相应的记录
	 * 
	 * @param c_id
	 * @param r_id
	 * @return
	 */
	public boolean findByC_idAndRc_ridIsexited(int c_id, int r_id) {
		String sql = "select * from " + TableName
				+ " where c_id =? and r_id = ?";
		Role_change role_change = findFirst(sql, c_id, r_id);
		if (role_change == null) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 通过r_id查找记录
	 * 
	 * @param r_id
	 * @return
	 */
	public List<Role_change> findByR_id(int r_id) {
		List<Role_change> list = find("select * from " + TableName
				+ " where r_id = ?", r_id);
		if (list.size() == 0) {
			return null;
		}
		return list;
	}
	/**
	 * 通过r_id查找一条记录
	 * 
	 * @param r_id
	 * @return
	 */
	public Role_change findFirstByR_id(int r_id) {
		Role_change role = findFirst("select * from " + TableName
				+ " where r_id = ?", r_id);
		return role;
	}

	/**
	 * 返回所有角色异动关系表信息(联动=角色表和异动表)
	 * 
	 * @return
	 */
	public List<Role_change> findAll() {
		// select * from role_change a,change_apply b,role c where
		// c.`r_id`=a.`r_id` and a.`c_id`=b.`c_id`
		return Role_change.me.find("select * from " + TableName + " a,"
				+ ChangeTableName + " b, " + RoleTableName
				+ " c  where c.r_id=a.r_id and a.c_id=b.c_id ");

	}

	/**
	 * 返回所有角色异动关系表信息(联动=角色表和异动表)根据c_id
	 * 
	 * @param c_Id
	 * @return
	 */
	public List<Role_change> findAllByC_id(int c_Id) {

		// select * from role_change a,change_apply b,role c where
		// c.`r_id`=a.`r_id` and a.`c_id`=b.`c_id`
		List<Role_change> changeList = Role_change.me
				.find("select distinct * from "
						+ TableName
						+ " a,"
						+ ChangeTableName
						+ " b, "
						+ RoleTableName
						+ " c  where a.c_id=? and c.r_id=a.r_id and a.c_id=b.c_id ",
						c_Id);

		return changeList;

	}

	/**
	 * 返回所有角色异动关系表信息(联动=角色表和异动表)根据c_name和r_name
	 * 
	 * @param c_Id
	 * @return
	 */
	public List<Role_change> findAllByC_NameAndR_Name(String c_name,
			String r_name) {

		List<Role_change> changeList = Role_change.me
				.find("select distinct * from "
						+ TableName
						+ " a,"
						+ ChangeTableName
						+ " b, "
						+ RoleTableName
						+ " c  where b.c_name=? and c.r_name = ? and c.r_id=a.r_id and a.c_id=b.c_id ",
						c_name, r_name);

		return changeList;

	}
}
