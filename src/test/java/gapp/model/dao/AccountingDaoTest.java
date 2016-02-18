/*package gapp.model.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import gapp.model.Applications;
import gapp.model.Department;
import gapp.model.Terms;
import gapp.model.dao.AccountingTestDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.TermsDao;



@Test(groups = "AccountingDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class AccountingDaoTest extends AbstractTransactionalTestNGSpringContextTests 
{
    @Autowired
    TermsDao termDao;
    
    @Autowired
    DepartmentDao departmentDao;
    
    @Autowired
    AccountingTestDao accountingDao;
    @Test
    public void checkAccDepartment(){
    	
    	Terms term = termDao.getTerm("Fall 2016");
    	Department dept = departmentDao.getDepartment("Accounting Department");
    	List<Applications> applications = accountingDao.getAllData(dept, term);
    	assert applications.size()==1;
    }
    
    
}*/

Hi Man this is added by Guru