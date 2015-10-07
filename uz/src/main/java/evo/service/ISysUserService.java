package evo.service;

import java.util.List;

import evo.model.SysDepartment;
import evo.model.SysRole;
import evo.model.SysUser;
import evo.util.Page;

public interface ISysUserService {

	
	List<SysUser> findUserByName(String userName);
	/**
	 * 登陆
	 */
	//public SysUser doLogin(String userName,String userPass);
	
    /**
     * 登陆
     * 根据用户名和密码查询用户信息
     */
	public SysUser findSysUserByNameAndPass(String userName, String userPass);
	
	/**
	 * 根据userName和userPass查询角色信息
	 */
	public SysUser findSysRoleByUserNameAndUserPass(String userName,String userPass);
	
	/**
	 * 用户注册
	 */
	public void insertSysUser(SysUser sysUser);
	
	/**
	 * 删除用户(根据用户id)
	 */
	public void deleteSysUserByUserId(Integer userId);
	
	/**
	 * 根据用户名修改密码
	 */
	public void updateSysUserByName(SysUser sysUser);
	
	/**
	 * 
	 * @Title: updateSysUser
	 * @Description: 修改用户信息
	 * @author Demo demo_@evo_com
	 * @param @param sysUser    设定文件
	 * @return void    返回类型
	 * @throws
	 */
	public void updateSysUser(SysUser sysUser);
	
	/**
	 * 
	 * @Title: findSysUserList
	 * @Description: 查询所以用户信息List
	 * @author Demo demo_@evo_com
	 * @param @return    设定文件
	 * @return List<SysUser>    返回类型
	 * @throws
	 */
	public List<SysUser> findSysUserList();
	
	/**
	 * 
	 * @Title: findSysUserListByPage
	 * @Description: 查询所以用户信息List-分页
	 * @author Demo demo_@evo_com
	 * @param @return    设定文件
	 * @return List<SysUser>    返回类型
	 * @throws
	 */
	public List<SysUser> findSysUserListByPage(Page page,SysUser sysUser);
	
	/**
	 * 
	 * @Title: findSysDepartmentBySysUserId
	 * @Description: 根据用户id查询部门信息
	 * @author Demo demo_@evo_com
	 * @param @param sysUser
	 * @param @return    设定文件
	 * @return SysDepartment    返回类型
	 * @throws
	 */
	public SysUser findSysDepartmentBySysUserId(SysUser sysUser);
	/**
	 * 
	 * @Title: findSysDepartmentBySysUserId
	 * @Description: 根据用户id查询部门信息
	 * @author Demo demo_@evo_com
	 * @param @param sysUser
	 * @param @return    设定文件
	 * @return SysDepartment    返回类型
	 * @throws
	 */
	public SysUser findSinglUserById(SysUser sysUser);
	
	/**
	 * 
	 * @Title: findUserById
	 * @Description: 根据用户id查询用户信息
	 * @author Demo demo_@evo_com
	 * @param @param sysUser
	 * @param @return    设定文件
	 * @return  SysUser   返回类型
	 * @throws
	 */
	public SysUser findUserById(Integer userId);
	
	
	/**
	 * 
	 * @Title: findMultyUserByRole
	 * @Description: 根据roleId批量查询SysUser的List
	 * @author Demo demo_@evo_com
	 * @param @param roleId
	 * @param @return    设定文件
	 * @return List<SysUser>    返回类型
	 * @throws
	 */
	public List<SysUser> findMultyUserByRole(Integer roleId);
	
	
	/**
	 * 
	 * @Title: findSysUserByDepartId
	 * @Description: 根据部门id查询用户信息
	 * @author Demo demo_@evo_com
	 * @param @param sysDepartment
	 * @param @return    设定文件
	 * @return List    返回类型
	 * @throws
	 */
	public List findSysUserByDepartId(SysDepartment sysDepartment);

	public SysUser findUserByPhoneNum(String phoneNum);
	
	/**
	 * 
	 * @Title: addBindRole
	 * @Description: 权限绑定 --- 作废
	 * 				   带着roleId插入到用户表中
	 * @author Demo demo_@evo_com
	 * @param @param sysRole
	 * @param @param response
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public void addBindRole(Integer[] sysUserId);
	
	/**
	 * 
	 * @Title: addBindRole
	 * @Description: 解除权限绑定 --- 作废
	 * 				   带着roleId插入到用户表中
	 * @author Demo demo_@evo_com
	 * @param @param sysRole
	 * @param @param response
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public void deleteBindRole(Integer[] sysUserId);
	
	
	/**
	* @Title: checkUserExist 
	* @Description: 根据用户名检查用户是否存在
	* @param userName
	* @return 
	* boolean
	* @throws
	 */
	public boolean checkUserExist(String userName);

	/**
	 * 
	 * @Title: addBindRole
	 * @Description: 权限绑定
	 * 				   带着roleId插入到用户表中
	 * @author Demo demo_@evo_com
	 * @param @param sysRole
	 * @param @param response
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public void addBindRole(String roleId,String[] sysUserId);
	
	/**
	 * 
	 * @Title: addBindRole
	 * @Description: 解除权限绑定 
	 * 				   带着roleId插入到用户表中
	 * @author Demo demo_@evo_com
	 * @param @param sysRole
	 * @param @param response
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public void deleteBindRole(String roleId,String[] sysUserId);
	
	
	/**
	 * 
	 * @Title: updateBindRole
	 * @Description: 权限绑定
	 * 				   带着roleId插入到用户表中
	 * @author Demo demo_@evo_com
	 * @param @param sysRole
	 * @param @param response
	 * @param @return    设定文件
	 * @return String    返回类型
	 * @throws
	 */
	public void updateBindRole(String roleId,String[] sysUserId);
	
	
	
	public void removeBindRole(String roleId,String[] sysUserId);
	
}
