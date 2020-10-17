package db;

import java.util.Date;

public class Users {
    private Long id;
    private String email;
    private String password;
    private String fullName;
    private Date birthdate;
    private String picture_url;

    public Users() {
    }

    public Users(Long id, String email, String password, String fullName, Date birthdate, String picture_url) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.birthdate = birthdate;
        this.picture_url = picture_url;
    }

    public Users(Long id, String email, String fullName, Date birthdate, String picture_url) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.birthdate = birthdate;
        this.picture_url = picture_url;
    }

    public Users(Long id, String email, String password, String fullName, Date birthdate) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.birthdate = birthdate;
        this.picture_url="https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2020/07/solar_orbiter_s_first_view_of_the_sun2/22133123-1-eng-GB/Solar_Orbiter_s_first_view_of_the_Sun_pillars.png";
    }
    Posts posts=new Posts();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getPicture_url() {
        return picture_url;
    }

    public void setPicture_url(String picture_url) {
        this.picture_url = picture_url;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", fullName='" + fullName + '\'' +
                ", birthdate=" + birthdate +
                ", picture_url='" + picture_url + '\'' +
                '}';
    }
}
