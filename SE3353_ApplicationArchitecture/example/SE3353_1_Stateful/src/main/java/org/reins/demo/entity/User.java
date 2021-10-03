package org.reins.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "user", schema = "bookstore")
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer","fieldHandler"})
public class User {

  private int userId;
  private String nickname;
  private String name;
  private String tel;
  private String address;

  @Id
  @Column(name = "user_id")
  @GeneratedValue(strategy = IDENTITY)
  public int getUserId() {
    return userId;
  }
  public void setUserId(int userId) {
    this.userId = userId;
  }


  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }


  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }


  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }


  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }

}
