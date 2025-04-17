package com.mypackage.model;

public class User {
	private int id;
    private String username;
    private String email;
    private String password; // password non in chiaro
    private boolean admin;

    // Costruttori
    public User() {}

    public User(int id, String username, String email, String password) {
    	this.id=id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.admin = false;
    }
    
    public User(int id, String username, String email, String password, boolean isAdmin) {
    	this.id=id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.admin = isAdmin;
    }

    // Getter e Setter
     public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

    
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
    
    public boolean isAdmin() {
    	return admin;
    }
    
    public void setAdmin(boolean admin) {
    	this.admin=admin;
    }
    
}