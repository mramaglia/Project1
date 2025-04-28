package com.mypackage.dao;

import com.mypackage.model.User;

public interface UserDAO {
    public boolean addUser (String username, String email, String password);
}

