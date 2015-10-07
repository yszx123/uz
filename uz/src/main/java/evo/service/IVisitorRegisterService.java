package evo.service;

import java.util.List;
import java.util.Map;

import evo.model.VisitorRegister;
import evo.util.Page;

public interface IVisitorRegisterService {

	/**
	 * 查询所有访问者记录
	 */
	public List<VisitorRegister> findVisitorRegisterList();
	
	/**
	 * 查询所有访问者记录
	 */
	public List<VisitorRegister> findAll(Map map);
	
	/**
	 * 根据访问者的手机号查询访问者记录List
	 */
	public List<VisitorRegister> findVisitorRegisterByVisitorList(String phoneNum);
	
	
	/**
	 * 
	 * @Title: findVisitorRegisterListByRegisteId
	 * @Description: 根据visitorId查询访问记录List
	 * @author Demo demo_@evo_com
	 * @param @param registerId
	 * @param @return    设定文件
	 * @return List<VisitorRegister>    返回类型
	 * @throws
	 */
	public List<VisitorRegister> findVisitorRegisterListByVisitorId(Integer visitorId);
	
	/**
	 * 
	 * @Title: deleteVisitorRegisterByVisitorRegisterId
	 * @Description: 根据VisitorRegisterId删除访问记录
	 * @author Demo demo_@evo_com
	 * @param @param visitorRegisterId    设定文件
	 * @return void    返回类型
	 * @throws
	 */
	public void deleteVisitorRegisterByVisitorRegisterId(Integer visitorRegisterId);
	
	
	/**
	 * 
	 * @Title: insertVisitorRegister
	 * @Description: 插入访问记录
	 * @author Demo demo_@evo_com
	 * @param @param visitorRegister    设定文件
	 * @return void    返回类型
	 * @throws
	 */
	public void insertVisitorRegister(VisitorRegister visitorRegister);
	
	
	/**
	 * 
	 * @Title: findVisitorRegisterListByPage
	 * @Description: 查询所有来访记录List-分页
	 * @author Demo demo_@evo_com
	 * @param @param visitorRegister
	 * @param @param page
	 * @param @return    设定文件
	 * @return List<VisitorRegister>    返回类型
	 * @throws
	 */
	public List<VisitorRegister> findVisitorRegisterListByPage(VisitorRegister visitorRegister,Page page);
}
