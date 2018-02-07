package com.ffxa;

import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO
{

    private JdbcTemplate jdbcTemplate;
    // JdbcTemplate setter
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
    {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Saving a new User
    public void saveUser(User user)
    {
        String sql = "insert into users (name) values(?)";
        jdbcTemplate.update(sql, user.getName());
    }

    // Getting all the User
    public List<User> getAllUsers()
    {
        String sql = "select * from users";

        return jdbcTemplate.query(sql, rs -> {
            List<User> list = new ArrayList<>();
            while (rs.next())
            {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                list.add(user);
            }
            return list;
        });
    }
}
