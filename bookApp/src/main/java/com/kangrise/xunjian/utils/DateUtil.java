package com.kangrise.xunjian.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.util.StringUtils;

/**
 * 时间操作
 * @author gyw  2017-10-10
 */
public class DateUtil 
{
	private static SimpleDateFormat simFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat simFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private final static String DEFAULT_TIME = "08:00:00";//默认时分秒
	private final static String DEFAULT_BLANK = " ";//空格
	/**
	 * 判断时分秒是否是日期
	 * @param str
	 * @return true--时间格式  false-非时间格式
	 */
	private static boolean isValidDate(String hours) 
	{
		   boolean convertSuccess=true;
	       SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
	       try 
	       {
	          format.setLenient(false);
	          format.parse(hours);
	       } catch (ParseException e) {
	          // e.printStackTrace();
	    	  // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
	           convertSuccess=false;
	       } 
	       return convertSuccess;
	}
	/**
	 * 对时间进行处理返回一个正确的年月日和时分秒
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * @param type 1-开始时间      2-结束时间
	 * default  - 默认为08:00:00
	 * @return
	 * @throws ParseException 
	 */
	private static Date handleTime(Date time,String hours,int type) 
	{
		Date start = null;
		hours = hours.replace(" ", "");//去掉所有空格
		String[] times = hours.split(",");
		String handleTime = simFormat.format(time);
		try 
		{
			if(times.length==0)
			{
				times = new String[2];
				times[0] = DEFAULT_TIME;
				times[1] = DEFAULT_TIME;
			}
			if(type==1)//开始时间
			{
				if(StringUtils.isEmpty(times[0])) times[0] = DEFAULT_TIME;
				boolean flag = isValidDate(times[0]);//是否是时间类型字符串
				if(!flag) times[0] = DEFAULT_TIME;
				handleTime = handleTime+DEFAULT_BLANK+times[0];
			}
			else
			{
				if(times.length<2) 
				{
					times = new String[2];
					times[1] = DEFAULT_TIME;
				}
				if(StringUtils.isEmpty(times[1])) times[1] = DEFAULT_TIME;
				boolean flag = isValidDate(times[1]);//是否是时间类型字符串
				if(!flag) times[1] = DEFAULT_TIME;
				handleTime = handleTime+DEFAULT_BLANK+times[1];
			}
			start = simFormat2.parse(handleTime);	
		} catch (Exception e) 
		{
			return start;
		}
		return start;
	}
	/************************日***********************/
	/**
	 * 获取日的开始时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getStartDay(Date time,String hours)
	{
		Date start = handleTime(time,hours,1);
		return start;
	}
	/**
	 * 获取日的结束时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getEndDay(Date time,String hours)
	{
		Date end = handleTime(time,hours,2);
		return end;
	}
	
	/**
	 * 日期加天数
	 * @param date 日期
	 * @param n 加几天
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Date addDay(Date date,int n)
	{
		date.setDate(date.getDate()+n);
		return date;
	}
	/**
	 * 相差天数
	 * @param start
	 * @param end
	 * @return
	 */
	public static int differDays(Date start,Date end)
    {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(start);
        
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(end);
       int day1= cal1.get(Calendar.DAY_OF_YEAR);
        int day2 = cal2.get(Calendar.DAY_OF_YEAR);
        
        int year1 = cal1.get(Calendar.YEAR);
        int year2 = cal2.get(Calendar.YEAR);
        if(year1 != year2)   //同一年
        {
            int timeDistance = 0 ;
            for(int i = year1 ; i < year2 ; i ++)
            {
                if(i%4==0 && i%100!=0 || i%400==0)    //闰年            
                {
                    timeDistance += 366;
                }
                else    //不是闰年
                {
                    timeDistance += 365;
                }
            }
            
            return timeDistance + (day2-day1) ;
        }
        else    //不同年
        {      
            return day2-day1;
        }
    }

	/************************周***********************/
	/**
	 * 获取周的开始时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getStartWeek(Date time,String hours)
	{
		Date start = handleTime(time,hours,1);
		try 
		{
			Calendar c = new GregorianCalendar();
	        c.setFirstDayOfWeek(Calendar.MONDAY);
	        c.setTime(start);
	        c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek());
	        start = c.getTime();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return start;
	}
	/**
	 * 获取周的结束时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getEndWeek(Date time,String hours)
	{
		Date end = handleTime(time,hours,2);
		try 
		{
			Calendar c = new GregorianCalendar();
	        c.setFirstDayOfWeek(Calendar.MONDAY);
	        c.setTime(end);
	        c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek() + 6);
	        end = c.getTime();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return end;
	}
	/**
     * 判断传入日期是否是周一
     * @param date
     * @return
     */
    public static boolean isMonday(Date date)
    {
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(date); 
    	int week=cal.get(Calendar.DAY_OF_WEEK)-1;
    	if(week==1)
    	{
    		return true;
    	}
    	else 
    	{
			return false;
		}
    	
    }
	/************************月***********************/
	/**
	 * 获取月的开始时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getStartMonth(Date time,String hours)
	{
		Date start = handleTime(time,hours,1);
		try 
		{
			Calendar c = Calendar.getInstance(); 
			c.setTime(start);
	        c.add(Calendar.MONTH, 0);  
	        c.set(Calendar.DAY_OF_MONTH, 1);  
	        start =  c.getTime();  
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return start;
	}
	/**
	 * 获取月的结束时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getEndMonth(Date time,String hours)
	{
		Date end = handleTime(time,hours,2);
		try 
		{
			Calendar c = Calendar.getInstance();  
			c.setTime(end);
			c.add(Calendar.MONTH, 1);  
	        c.set(Calendar.DAY_OF_MONTH, 0);  
	        end = c.getTime();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return end;
	}
	/**
     * 是否是当月1号
     * @param date
     * @return
     */
    public static boolean isMonthFirst(Date date)
    {
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(date); 
    	int month=cal.get(Calendar.DAY_OF_MONTH);
    	if(month==1)
    	{
    		return true;
    	}
    	else 
    	{
			return false;
		}
    	
    }
	
	/************************季度***********************/
	/**
	 * 获取季度的开始时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Date getStartQuarter(Date time,String hours)
	{
		Date start = handleTime(time,hours,1);
		try 
		{
			int month = (start.getMonth()+1);//月份
			Calendar gc = Calendar.getInstance();  
			gc.setTime(start);
			int year = start.getYear();
			if(1<=month&&month<=3)//1-3----第一季度
			{
				gc.set(Calendar.MONTH, 12);//这里0是1月..以此向后推	
			}
			else if(4<=month&&month<=6)//4-6---第二季度
			{
				gc.set(Calendar.MONTH, 3);//这里0是1月..以此向后推
			}
			else if(7<=month&&month<=9)//7-9---第三季度
			{
				gc.set(Calendar.MONTH, 6);//这里0是1月..以此向后推
			}
			else//第四季度
			{
				gc.set(Calendar.MONTH, 9);//这里0是1月..以此向后推
			}
			gc.set(Calendar.DAY_OF_MONTH, 1);//设置天
			start = gc.getTime();
			start.setYear(year);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return start;
	}
	/**
	 * 获取季度的结束时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Date getEndQuarter(Date time,String hours)
	{
		Date end = handleTime(time,hours,2);
		try 
		{
			int month = (end.getMonth()+1);//月份
			Calendar gc = Calendar.getInstance();  
			gc.setTime(end);
			if(1<=month&&month<=3)//1-3----第一季度
			{
				gc.set(Calendar.MONTH, 3);//这里0是1月..以此向后推
			}
			else if(4<=month&&month<=6)//4-6---第二季度
			{
				gc.set(Calendar.MONTH, 6);//这里0是1月..以此向后推
			}
			else if(7<=month&&month<=9)//7-9---第三季度
			{
				gc.set(Calendar.MONTH, 9);//这里0是1月..以此向后推
			}
			else//第四季度
			{
				gc.set(Calendar.MONTH, 12);//这里0是1月..以此向后推
			}
			gc.set(Calendar.DAY_OF_MONTH, 0);//设置条--结束  
			end = gc.getTime();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return end;
	}
	/**
     * 是否是季度1号
     * @param date
     * @return
     */
    @SuppressWarnings("deprecation")
	public static boolean isQuarterFirst(Date date)
    {
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(date); 
    	int day=cal.get(Calendar.DAY_OF_MONTH);//几号
    	int month = date.getMonth()+1;//几月
    	if(day==1&&(month==1||month==4||month==7||month==10))
    	{
    		return true;
    	}
    	else 
    	{
			return false;
		}
    }
	
	/************************半年***********************/
	/**
	 * 获取半年的开始时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Date getStartHalfYear(Date time,String hours)
	{
		Date start = handleTime(time,hours,1);
		try 
		{
			int month = (start.getMonth()+1);//月份
			Calendar gc = Calendar.getInstance();  
			gc.setTime(start);
			int year = start.getYear();
			if(1<=month&&month<=6)//1-6----上半年
			{
				gc.set(Calendar.MONTH, 12);//这里0是1月..以此向后推	
			}
			else//下半年
			{
				gc.set(Calendar.MONTH, 6);//这里0是1月..以此向后推
			}
			gc.set(Calendar.DAY_OF_MONTH, 1);//设置天
			start = gc.getTime();
			start.setYear(year);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return start;
	}
	/**
	 * 获取半年的结束时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Date getEndHalfYear(Date time,String hours)
	{
		Date end = handleTime(time,hours,2);
		try 
		{
			int month = (end.getMonth()+1);//月份
			Calendar gc = Calendar.getInstance();  
			gc.setTime(end);
			if(1<=month&&month<=6)//1-6----上半年
			{
				gc.set(Calendar.MONTH, 6);//这里0是1月..以此向后推	
			}
			else//下半年
			{
				gc.set(Calendar.MONTH, 12);//这里0是1月..以此向后推
			}
			gc.set(Calendar.DAY_OF_MONTH, 0);//设置条--结束  
			end = gc.getTime();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return end;
	}
	/**
     * 是否是半年1号
     * @param date
     * @return
     */
    @SuppressWarnings("deprecation")
	public static boolean isHalfYearFirst(Date date)
    {
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(date); 
    	int day=cal.get(Calendar.DAY_OF_MONTH);//几号
    	int month = date.getMonth()+1;//几月
    	if(day==1&&month==6)
    	{
    		return true;
    	}
    	else 
    	{
			return false;
		}
    	
    }
	
	/************************年***********************/
	/**
	 * 获取年的开始时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getStartYear(Date time,String hours)
	{
		Date start = handleTime(time,hours,1);
		try 
		{
			Calendar c = Calendar.getInstance(); 
			c.setTime(start);
			c.set(Calendar.DAY_OF_YEAR, 1);  
			start = c.getTime();   
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return start;
	}
	/**
	 * 获取年的结束时间
	 * @param time 时间
	 * @param hours 时分秒开始时间，结束时间  
	 * default  - 默认为08:00:00
	 * @return
	 */
	public static Date getEndYear(Date time,String hours)
	{
		Date end = handleTime(time,hours,2);
		try 
		{
			Calendar c = Calendar.getInstance(); 
			c.setTime(end);
			c.set(Calendar.DAY_OF_YEAR,c.getActualMaximum(Calendar.DAY_OF_YEAR)); 
	        end = c.getTime(); 
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return end;
	}
	/**
     * 是否是季度1号
     * @param date
     * @return
     */
    @SuppressWarnings("deprecation")
	public static boolean isYearFirst(Date date)
    {
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(date); 
    	int day=cal.get(Calendar.DAY_OF_MONTH);//几号
    	int month = date.getMonth()+1;//几月
    	if(day==1&&month==1)
    	{
    		return true;
    	}
    	else 
    	{
			return false;
		}
    }

    /**
	 * 判断日周月季度半年年是否是周一，1号，季度第一天，半年第一天，年第一天
	 * @param identify-----日周月季度半年年标示---day、week、month...
	 * @param handledate---时间
	 * @return
	 */
	public static boolean isFirst(String identify,Date handledate)
	{
		if(identify.equals("day"))//日
		{
			return true;
		}
		//循环配置文件频率标识
		else if(identify.equals("week"))//周
		{
			boolean flag = DateUtil.isMonday(handledate);//是否是周一 
			if(!flag) return false;
		}
		else if(identify.equals("month"))//月
		{
			boolean flag = DateUtil.isMonthFirst(handledate);//是否是周一 
			if(!flag) return false;
		}
		else if(identify.equals("quarter"))//季度
		{
			boolean flag = DateUtil.isMonthFirst(handledate);//是否是周一 
			if(!flag) return false;
		}
		else if(identify.equals("halfyear"))//半年
		{
			boolean flag = DateUtil.isMonthFirst(handledate);//是否是周一 
			if(!flag) return false;
		}
		else if(identify.equals("year"))//年
		{
			boolean flag = DateUtil.isMonthFirst(handledate);//是否是周一 
			if(!flag) return false;
		}
		return true;
	}
	/**
	 * 判断日周月季度半年年返回结束时间
	 * @param identify-----日周月季度半年年标示---day、week、month...
	 * @param handledate---时间
	 * @param suffix---时分秒
	 * @return
	 */
	public static Date getEndTimeByIdentify(String identify,Date handledate,String suffix)
	{
		//循环配置文件频率标识
		//日
		if(identify.equals("day")) return DateUtil.getEndDay(handledate, suffix);
		//周
		else if(identify.equals("week")) return DateUtil.getEndWeek(handledate, suffix);
		//月
		else if(identify.equals("month")) return DateUtil.getEndMonth(handledate, suffix);
		//季度
		else if(identify.equals("quarter")) return DateUtil.getEndQuarter(handledate, suffix);
		//半年
		else if(identify.equals("halfyear")) return DateUtil.getEndHalfYear(handledate, suffix);
		//年
		else if(identify.equals("year")) return DateUtil.getEndYear(handledate, suffix);
		else return null;
	}
	/**
	 * 获取该时间的年月日，时分秒
	 * @return
	 */
	public static String getCurrenTime(Date date)
	{
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int year = c.get(Calendar.YEAR);//年
		int month = c.get(Calendar.MONTH)+1;//月
		int day = c.get(Calendar.DATE);//日
		int hour = c.get(Calendar.HOUR);//时
		int minute = c.get(Calendar.MINUTE);//分钟
		int second = c.get(Calendar.SECOND);//秒
		String time = "" + year;
		if(month<10) time = time + ("0"+month);
		else time = time + month;
		
		if(day<10) time = time + ("0"+day);
		else time = time + day;
		
		if(hour<10) time = time + ("0"+hour);
		else time = time + hour;
		
		if(minute<10) time = time + ("0"+minute);
		else time = time + minute;
		
		if(second<10) time = time + ("0"+second);
		else time = time + second;

		return time;
	}
	
	/**
	 * 获取星期几
	 *
	 */
	public enum WeekEnum 
	{  
		  
	    Mon("星期一",1),//1
	    Tue("星期二",2),// 2 
	    Wed("星期三",3),// 3 
	    Thu("星期四",4), //4 
	    Fri("星期五",5),//  5
	    Sat("星期六",6), // 6
	    Sun("星期日",0);//0        //对象之间用 ","  隔开  以";" 结束  
	    // 成员变量
		private String name;
		private int index;
		// 构造方法
		private WeekEnum(String name, int index) {
			this.name = name;
			this.index = index;
		}
		// 普通方法
		public static String getName(int index) {
			for (WeekEnum c : WeekEnum.values()) {
				if (c.getIndex() == index) {
					return c.name;
				}
			}
			return null;
		}
		// get set 方法
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getIndex() {
			return index;
		}
		public void setIndex(int index) {
			this.index = index;
		}
	}  
	
	public static void main(String[] args) throws ParseException 
	{
		/*String time = simFormat.format(new Date())+ " 08:00:00";
		
		
		System.out.println(simFormat2.parse(time).getTime());
		String s = getCurrenTime(new Date());System.out.println(s);*/
		/*String ss = "1457";
		String re = "";
		if(ss.length()>4)//长度大于4截取后四位
		{
			re = re  + ss.substring(ss.length()-5,ss.length());;
		}
		else//否则补位0
		{
			re = re  + String.format("%0" + 5 + "d", Integer.parseInt(ss));
		}
		System.out.println(re);*/
		Integer a = null;
		if(StringUtils.isEmpty(a)) System.out.println(a);
		else if(a.equals(0)) System.out.println(0);
		else System.out.println("空");
		
		
	
	}
}
