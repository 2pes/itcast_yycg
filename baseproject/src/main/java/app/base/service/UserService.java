package app.base.service;

import java.util.List;

import app.base.pojo.po.Sysuser;
import app.base.pojo.po.Usergys;
import app.base.pojo.po.Userjd;
import app.base.pojo.po.Useryy;
import app.base.pojo.vo.SysuserCustom;
import app.base.pojo.vo.SysuserQueryVo;

public interface UserService {

	// 根据条件查询用户信息
	public List<SysuserCustom> findSysuserList(SysuserQueryVo sysuserQueryVo) throws Exception;

	// 根据条件查询列表的总数
	public int findSysuserCount(SysuserQueryVo sysuserQueryVo) throws Exception;

	// 根据用户账号查询用户信息
	public Sysuser findSysuserByUserid(String userId) throws Exception;

	// 根据单位名称 查询单位信息
	public Userjd findUserjdByMc(String mc) throws Exception;

	public Useryy findUseryyByMc(String mc) throws Exception;

	public Usergys findUsergysByMc(String mc) throws Exception;

	// 添加用户
	public void insertSysuser(SysuserCustom sysuserCustom) throws Exception;
}
