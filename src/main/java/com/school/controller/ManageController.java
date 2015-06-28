package com.school.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import oracle.net.aso.r;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.MultipartRequest;
import com.jfinal.upload.UploadFile;
import com.school.Interceptor.ManageInterceptor;
import com.school.model.Approve_person;
import com.school.model.Change;
import com.school.model.Role;
import com.school.model.Role_change;
import com.school.model.Student_apply;
import com.school.model.Xydmb;
import com.sun.org.apache.xml.internal.serializer.utils.StringToIntTable;

public class ManageController extends Controller {
	/**
	 * 注销重新登录
	 */
	public void unLogin() {
		HttpSession session = getSession();
		session.invalidate();
		redirect("/index");
	}
	/**
	 * 按照分页进行显示
	 */
	public void manage_page() {
		int paraString = getPara("page") == null ? 1 : getParaToInt("page");
		Page<Approve_person> apPage = Approve_person.me
				.paginate(paraString, 10);
		System.out.println(apPage);
		setAttr("approve_page", apPage);// 从url中获得参数，并将默认值转化为int类型的值.

	}

	/**
	 * 根据c_name获取c_id,添加角色id和顺序
	 */
	public void getRoleAndSort() {
		String c_nameString = getPara("c_name");
		Change change = Change.me.findIDChangeByName(c_nameString);
		// 根据异动类型添加角色和顺序
		int c_id = change.getInt("c_id");
		// 选择角色
		// List<Role_change> rcLists = Role_change.me.findAll();
		List<Role_change> rcList = Role_change.me.findAllByC_id(c_id);
		String rcJson = JsonKit.toJson(rcList);
		System.out.println(rcJson);
		renderJson(rcJson);
		// //顺序个数,默认1为学生,不容更改

	}

	/**
	 * 增加角色
	 */
	public void addRole() {
		String role_name = getPara("role_name").toString().trim();
		String role_level = getPara("role_level").toString().trim();
		Role role=Role.me.findByname(role_name.trim());
		if (role!=null) {
			renderJson(0);//您输入的角色名称已经存在
		}else{//如果不相等,则进行保存数据
			Record record=new Record();
			record.set("r_name", role_name);
			record.set("r_level", role_level);
			Role.me.saveRoleByRecord(record);
			renderJson(1);
		}
	}

	/**
	 * 根据c_name获取c_id,添加角色id和顺序
	 */
	public void setRoleAndSort() {
		String c_nameString = getPara("c_name");
		int sort_sum = getParaToInt("sort_sum");
		Change change = Change.me.findIDChangeByName(c_nameString);
		// 根据异动类型添加角色和顺序
		int c_id = change.getInt("c_id");
		// 选择角色
		List<Role> rList = Role.me.findAll();

		setAttr("rList", rList);
		setAttr("sort_sum", sort_sum);
		// //顺序个数,默认1为学生,不容更改

	}

	/**
	 * 判断如果对应的异动类型有了相同的顺序的时候,报异常
	 */
	public boolean judgeByC_idAndRc_sortIsexited(int c_id, String r_name) {
		Role role = Role.me.findByname(r_name);
		int r_id = role.getInt("r_id");

		boolean flag = Role_change.me.findByC_idAndRc_ridIsexited(c_id, r_id);// 如果为true的话,则存在,false的话不存在就可以继续添加

		if (flag) {
			return true;// 存在
		} else {
			return false;// 不存在
		}
	}

	/**
	 * 保存角色和异动之间的关系
	 */
	public void saveRoleAndChange() {
		String c_nameString = getPara("c_name");
		String role_nameString = getPara("r_name");
		Change change = Change.me.findIDChangeByName(c_nameString);
		// 根据异动类型添加角色和顺序
		int c_id = change.getInt("c_id");
		// -------------------------------
		Role role = Role.me.findByname(role_nameString);
		int r_id = role.getInt("r_id");

		int rc_sort = getParaToInt("rc_sort");
		// 判断如果对应的异动类型有了相同的顺序的时候,报异常
		// 需要异步判断角色名称有没有重复
		boolean sign = judgeByC_idAndRc_sortIsexited(c_id, role_nameString);
		if (sign) {
			// setAttr("msg", "该角色已经存在相应的顺序");
			renderJson(505);
		} else {
			// -------------------------------
			Record record = new Record();
			record.set("r_id", r_id);
			record.set("c_id", c_id);
			record.set("rc_sort", rc_sort);
			boolean flag = DbPro.use().save("role_change", record);
			if (flag) {
				boolean flag2 = Change.me.updateStepsByC_id(c_id);
				if (flag2) {
					renderJson(1);// 更新成功
				} else {
					renderJson(0);// 更新失败
				}

			} else {
				renderText("保存失败");
			}
		}
	}

	/**
	 * 删除异动角色关系
	 */
	public void deleteChangeRole() {
		int r_id = getParaToInt("r_id");
		int c_id = getParaToInt("c_id");
		// 通过角色和异动类型查找到rc_id,再根据rc_id删除记录
		Role_change role_change = Role_change.me.findByC_idAndR_id(c_id, r_id);
		int rc_id = role_change.getInt("rc_id");
		int rc_sort = role_change.getInt("rc_sort");
		if (Role_change.me.deleteById(rc_id)) {
			// 删除成功后,其他剩余的rc_sort自动减一  此时总步骤也应该减一
			boolean flag = Role_change.me.deleteAfter_minus(rc_sort, c_id);
			if (flag) {
				renderJson(1);
			} else {
                Change.me.updateSteps_minus(c_id);
				renderJson(0);
			}

		} else {
			renderJson(0);
		}

	}

	/**
	 * 验证账号是否重复
	 */
	public void validate_account() {
		String accountString = getPara("account");
		System.out.println(accountString);
		if (Approve_person.me.accountIsExited(accountString)) {
			setAttr("validate_account", "false");
			renderJson();
		} else {
			setAttr("validate_account", "true");
			renderJson();
		}

	}

    /**
     * 根据角色id删除角色
     */
    public void deleteRole(){
        int r_id=getParaToInt("role_id");//获取r_id的参数
        boolean flag=Role.me.deleteById(r_id);
        if (flag){
            renderJson(1);
        }else{
            renderJson(0);
        }
    }

    /**
     * 根据角色id更新角色
     */
    public void updateRole(){
        Role role=getModel(Role.class, "role");
    }

	/**
	 * 根据异动类型获取对应的角色类型和
	 */
	public void getChange() {
		getApply_Student();
		manage_page();
		getChange_apply();
		render("index.jsp");
	}

	/**
	 * 将审核人的所有信息返回到主页面
	 */
	@Before(ManageInterceptor.class)
	public void index() {
		getApply_Student();
		manage_page();
		// 角色名称
		List<Role> rList = Role.me.findAll();
		setAttr("rList", rList);
		getChange_apply();
		render("index.jsp");
	}

	/**
	 * 获取异动类型
	 */
	public void getChange_apply() {
		List<Change> list = Change.me.findAll();
		setAttr("change", list);
	}

	/**
	 * 获取异动角色数据
	 */
	public void changeByC_id() {
		String c_nameString = getPara("c_name");
		if (c_nameString != null && !c_nameString.equals("")) {

			Change change = Change.me.findIDChangeByName(c_nameString);
			int c_id = change.getInt("c_id");
			List<Role_change> change_roleList = Role_change.me
					.findAllByC_id(c_id);
			if (change_roleList.size() > 0) {
				setAttr("changeRole_list", change_roleList);
				render("changeByC_id.jsp");
			} else {
				setAttr("msg", "该异动暂时没有信息");
				render("changeByC_id.jsp");
			}
		} else {
			setAttr("msg", "该异动没有信息");
			render("changeByC_id.jsp");
		}

		// 根据异动类型添加角色和顺序

	}

	/**
	 * 获取学生申请的基本信息
	 */
	public void getApply_Student() {
		List list = Student_apply.me.findByStudent_appliesAndChange();
		setAttr("stu_lists", list);

	}

	/**
	 * 添加审核人页面
	 */
	public void add_approve() {
		render("add_approve.jsp");
	}

	/**
	 * 渲染审核人页面
	 */
	public void approve() {
		render("approve.jsp");
	}

	/**
	 * 增加审核人
	 */
	public void addApprove() {
		// 获得传过来的数据
		String imgString = handleImage();
		Approve_person approve_person = getModel(Approve_person.class, "app");
		approve_person.set("a_img", imgString);
		String r_nameString = getPara("r_name");
		Role role = Role.me.findByname(r_nameString);
		approve_person.set("r_id", role.getInt("r_id"));
		approve_person.set("a_type", role.get("r_level"));
		approve_person.save();
		index();
	}

	/**
	 * 处理上传图片,返回图片路径
	 */
	public String handleImage() {
		String savepath = "/upload/image/approve/";// 定义您的图片路径基于webroot
		UploadFile file = getFile();// 获取前台上传文件
		if (file == null) {
			return null;
		}
		String nameString = getPara("app.a_account");// 自定义名称img_name
		String fileName = file.getFileName();// 获取文件名
		String subStringName = fileName.substring(fileName.lastIndexOf("."),
				fileName.length());// 文件后缀名
		String paString = savepath + nameString + subStringName;// 文件路径
		File fi = new File(PathKit.getWebRootPath() + paString);// 创建新的文件
		file.getFile().renameTo(fi);// 给保存的文件重新命名
		return paString;
	}

	public void manage_student() {
		render("manage_student.jsp");
	}

	/**
	 * 修改审核人
	 */
	public void handle_approve() {
		int a_id = getParaToInt();
		Approve_person approve_person = Approve_person.me.findById(a_id);
		int r_id = approve_person.get("r_id");
		approve_person.put("r_name", Role.me.getRNameByID(r_id));
		setAttr("app", approve_person);
		render("handle_approve.jsp");
	}

	/**
	 * 更新审核人
	 */
	public void editApprove() {

		// 获得传过来的数据
		String imgpathString = handleImage();
		Approve_person approve_person = getModel(Approve_person.class, "app");

		String r_name = getPara("r_name");
		if (imgpathString != null) {
			approve_person.set("a_img", imgpathString);
		}

		Role role = Role.me.findByname(r_name);
		approve_person.set("r_id", role.getInt("r_id"));
		String cc = role.get("r_level");
		approve_person.set("a_type", role.get("r_level"));
		// approve_person.put("a_type", role.get("r_level"));
		approve_person.update();
		index();
	}

	/**
	 * 删除审核人
	 */
	public void deleteApprove() {
		// 获得传过来的数据
		int a_id = getParaToInt();
		Approve_person approve_person = Approve_person.me.findById(a_id);
		String img_pathString = approve_person.get("a_img");
		File file = new File(PathKit.getWebRootPath() + img_pathString);
		if (file.delete()) {
			Approve_person.me.deleteById(a_id);
			// 删除记录后删除资源
			redirect("/manage/index");
			// index();
		} else {
			renderText("删除失败");
		}

	}

	/**
	 * 获取学院
	 */
	public void getAcademy() {
		System.out.println(JsonKit.toJson(Xydmb.me.findAll()));
		renderJson(Xydmb.me.findAll());
	}
    /**
     * getRole
     */
    public void getRoleJSP(){
        setSessionAttr("role", Role.me.findAll());
        render("role.jsp");
    }

	/**
	 * 获取角色类型getR_name
	 */
	public void getR_name() {
		renderJson(Role.me.findAll());
	}

	/**
	 * 根据角色名称和异动类型查找数据库中的相应的顺序,若没有默认为1,若有在此基础上加1
	 */
	public void setRoleSort() {
		String change_cName = getPara("c_name");
		Change change = Change.me.findIDChangeByName(change_cName);
		int c_id = change.getInt("c_id");
		List<Role_change> role_changes = Role_change.me.findAllByC_id(c_id);
		System.out.println(role_changes.size());
		if (role_changes.size() == 0) {
			renderJson(1);
		} else {
			renderJson(role_changes.size() + 1);
		}
	}
}
