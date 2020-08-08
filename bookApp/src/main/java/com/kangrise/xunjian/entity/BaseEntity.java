package com.kangrise.xunjian.entity;

import java.lang.reflect.Field;
import java.util.Date;

public class BaseEntity {

	//创建人id
	protected Long creatorId;

	//创建时间
    protected Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }
    
    /**
     * springMVC接收对象无法装载对象初始化值，装载初始化值
     * @param mvcObject
     * @return
     */
    public static <T extends BaseEntity> T installDefaltValueFromMVC(T mvcObject){
    	try {
			Field[] declaredFieldsOfMvcObject = mvcObject.getClass().getDeclaredFields();
			
			@SuppressWarnings("unchecked")
			T newObject = (T) mvcObject.getClass().newInstance();
			Field[] declaredFieldsOfnewObject = newObject.getClass().getDeclaredFields();
			for (Field mvcfield : declaredFieldsOfMvcObject) {
				for (Field newfield : declaredFieldsOfnewObject) {
					mvcfield.setAccessible(true);
					newfield.setAccessible(true);
					
					if(		mvcfield.getType().equals(newfield.getType()) 
							&& mvcfield.getName().equals(newfield.getName())
							&& mvcfield.get(mvcObject) == null
							&& newfield.get(newObject) != null
							){
						
						mvcfield.set(mvcObject, newfield.get(newObject));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return mvcObject;
    }
    
}
