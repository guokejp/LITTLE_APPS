package com.kangrise.xunjian.utils;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.kangrise.xunjian.admin.equip.resFidleColumn.EquipFieldColumn;
import com.kangrise.xunjian.admin.equip.resFidleColumn.FieldColumn;

public class SysLoadUtils {
	private static final Log logger = LogFactory.getLog(BaseUtiles.class);
	//设备不同字段读取
	private static Map<String, EquipFieldColumn> equipFieldColumnMap = new HashMap<String, EquipFieldColumn>();



	public static Map<String, EquipFieldColumn> getEquipFieldColumnMap() {
		return equipFieldColumnMap;
	}

	public static void setEquipFieldColumnMap(Map<String, EquipFieldColumn> equipFieldColumnMap) {
		SysLoadUtils.equipFieldColumnMap = equipFieldColumnMap;
	}
	
	
	
	

	public static void loadEquipFieldColumn(){
		try{
			SAXReader reader = new SAXReader();
			InputStream xmlStream = SysLoadUtils.class.getClassLoader().getResourceAsStream("/sysload/EquipXmlfield.xml");
			Document doc = reader.read(xmlStream);
			Element resList = doc.getRootElement().element("resList");
			if(resList == null){
				return;
			}
			List<Element> resEleList = resList.elements("resource");
			if(resEleList == null || resEleList.size() == 0){
				return;
			}
			for (Element resEle : resEleList) {
				EquipFieldColumn eq = new EquipFieldColumn();
				String dbid = resEle.attribute("dbid").getValue();
				String type = resEle.attribute("type").getValue();
				
				eq.setDbid(dbid);
				eq.setType(type);
				eq.setExplain(resEle.attribute("explain").getValue());
				
				Element fidEleListele = resEle.element("fieldList");
				List<Element> fieldList = fidEleListele.elements("fieldcolumn");
				
				List<FieldColumn> fieldColumnList = new ArrayList<FieldColumn>();
				
				if(fieldList==null || fieldList.size() == 0){
					eq.setFieldColumnList(fieldColumnList);
					SysLoadUtils.equipFieldColumnMap.put(dbid+type, eq);
					continue;
				}
				for (Element fele : fieldList) {
					FieldColumn fc = new FieldColumn();
					fc.setField(fele.attribute("field").getValue());
					fc.setColumn(fele.attribute("column").getValue());
					fc.setStyle(fele.attribute("style").getValue());
					fc.setUsefx(fele.attribute("usefx").getValue());
					fc.setFxname(fele.attribute("fxname").getValue());
					fc.setFixtype(fele.attribute("fixtype").getValue());
					fieldColumnList.add(fc);
				}
				eq.setFieldColumnList(fieldColumnList);
				SysLoadUtils.equipFieldColumnMap.put(dbid+type, eq);

			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
