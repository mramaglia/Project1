package com.mypackage.model;

public class User {
    private String username;
    private String email;
    private String password; // Considera di non memorizzare la password in chiaro

    // Costruttori
    public User() {}

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    // Getter e Setter
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getEmail() {
    	return  email;
    }
    
    public void setEmail(String email) {
    	this.email = email;
    }
}