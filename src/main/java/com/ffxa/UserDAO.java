package com.ffxa;

import java.util.List;
public interface UserDAO
{
    void saveUser(User user);
    List<User> getAllUsers();
}
