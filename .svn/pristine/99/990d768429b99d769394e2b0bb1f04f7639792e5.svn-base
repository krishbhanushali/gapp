package gapp.model.dao;



import java.sql.SQLException;
import java.util.List;

import gapp.model.User;

public interface UserDao {

    User getUser( Integer id );

    List<User> getUsers();

    User getUser(String name);
    
    User getUserByEmailAndPassword(String emailID,String password) throws SQLException;

    User getUserByEmail(String emailID);
    
	User save(User user);
}