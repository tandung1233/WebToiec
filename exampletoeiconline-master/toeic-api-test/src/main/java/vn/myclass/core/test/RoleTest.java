package vn.myclass.core.test;

import org.junit.Test;

import java.util.List;
import vn.myclass.core.dao.RoleDao;
import vn.myclass.core.daoimpl.RoleDaoImpl;
import vn.myclass.core.persistence.entity.RoleEntity;

public class RoleTest {
	@Test
	public void checkFindAll() {
		RoleDao roleDao = new RoleDaoImpl();
		List<RoleEntity> list = roleDao.findAll();
	}
}
