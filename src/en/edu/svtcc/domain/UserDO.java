package en.edu.svtcc.domain;

public class UserDO {
    private int id;
    private String username;
    private String password;
    private String tel;
    private String gender;
    private String email;
    private String realname;

    public UserDO(){

    }

    public UserDO(int id, String username, String password, String tel, String gender,
                  String email, String realname) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.tel = tel;
        this.gender = gender;
        this.email = email;
        this.realname = realname;
    }

    public UserDO(int id, String username, String password, String tel) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.tel = tel;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        return "UserDO{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                '}';
    }
}
