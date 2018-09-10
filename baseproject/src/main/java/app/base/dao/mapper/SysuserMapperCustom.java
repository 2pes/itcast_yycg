package app.base.dao.mapper;

import java.util.List;

import app.base.pojo.vo.SysuserCustom;
import app.base.pojo.vo.SysuserQueryVo;

public interface SysuserMapperCustom {

	// 查询用户列表
	public List<SysuserCustom> findSysuserList(SysuserQueryVo sysuserQueryVo) throws Exception;

	// 查询总数
	public int findSysuserCount(SysuserQueryVo sysuserQueryVo) throws Exception;

}
