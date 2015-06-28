package com.school.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class Role extends Model<Role> {
	public static final String TableName = "role";
	public static final Role me = new Role();
	/**
	 * 获取角色的名称类型
	 * 
	 */
	public List<Role> findAll() {
		return find("select * from "+TableName);
	}

	/**
	 * 通过id获取角色的名称类型
	 * 
	 * @param id
	 * @return
	 */
	public String getRNameByID(int id) {
		List<Role> roles = find("select * from  "+TableName+"   where r_id = ?", id);
		if (roles.size() != 0) {
			return roles.get(0).get("r_name");
		}
		return null;
	}
	/**
	 * 通过角色的名称类型获得id
	 * 
	 * @param name
	 * @return
	 */
	public Role findByname(String name) {
		List<Role> roles = find("select * from  "+TableName+"   where r_name = ?", name);
		if (roles.size() != 0) {
			return roles.get(0);
		}
		return null;
	}

	/**
	 * 通过id获取角色的层次等级
	 * 
	 * @param id
	 * @return
	 */
	public Role getRoleByID(int id) {
		List<Role> roles = find("select * from  "+TableName+"   where r_id = ?", id);
		if (roles.size() != 0) {
			return roles.get(0);
		}
		return null;
	}
	/**
	 * 将获取到的角色名称和等级,进行保存
	 */
	public void saveRoleByRecord(Record record) {
		Db.save(TableName, record);
	}
}
