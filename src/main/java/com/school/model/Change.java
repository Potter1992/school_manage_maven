package com.school.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Model;

public class Change extends Model<Change> {
	public static final String TableName = "change_apply";
	public static final Change me = new Change();

    /**
     * 通过异动id将其总步骤减一
     * @param c_id
     */
    public void updateSteps_minus(int c_id){
        DbPro.use().update("update "+TableName+" set c_number = c_number-1   where  c_id = ?",c_id);
    }
	/**
	 * 
	 * @return 异动类型
	 */
	public List<Change> findAll() {
		
		return find("select * from   "+TableName);
	}

	/**
	 * 根据异动类型名称查找c_id
	 */
	public Change findIDChangeByName(String c_name) {
		Change change = findFirst("select * from   "+TableName+"    where c_name = ?",c_name);
		return change;
	}
	/**
	 * 根据异动c_id名称查找总步数
	 */
	public Change findStepsByC_id(int c_id) {
		Change change = findFirst("select * from   "+TableName+"    where c_id= ?",c_id);
		return change;
	}
	/**
	 * 总步数+1
	 */
	public boolean updateStepsByC_id(int c_id) {
		//在原先的总步数基础上加一update  `change_apply` set c_number = c_number+1 where `c_id`=1
//		DbPro.use().update(sql, paras)
		int flag=Db.update("update  "+TableName+" set c_number = c_number+1 where  c_id = ?",c_id);
		if (flag>0) {
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 根据c_id名称查找c_name
	 */
	public Change findNameChangeByIDString(int  c_id) {
		Change change = findFirst("select * from   "+TableName+"    where c_id = ?",c_id);
		return change;
	}
}
