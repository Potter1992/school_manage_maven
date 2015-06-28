package com.school.common;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.school.model.Zfxfzb_xsjbxxb;

public class Oracle_config extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
			loadPropertyFile("oracle_config.properties");//加载配置文件
			me.setDevMode(getPropertyToBoolean("config.devModel", false));
			me.setViewType(ViewType.JSP);
			me.setEncoding("UTF-8");
	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
			ActiveRecordPlugin arp=null;
			String driver=getProperty("oracle.driver");
			String url=getProperty("oracle.url");
			String username=getProperty("oracle.username");
			String password=getProperty("oracle.password");
			DruidPlugin dp=new DruidPlugin(url, username, password, driver);
			me.add(dp);
			arp=new ActiveRecordPlugin(dp);//设置数据库方言
			arp.setDialect(new OracleDialect());
			arp.setContainerFactory(new CaseInsensitiveContainerFactory());//忽略大小写
			me.add(new EhCachePlugin());
			arp.addMapping("users", "id",Zfxfzb_xsjbxxb.class);
			me.add(arp);
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		
	}

}
