package com.kwani.domain;

import lombok.Data;

@Data
public class UserVO {

   private String email;
   private String nick;
   private String pwd;
   private String userImg;
   private Integer stusCd;
   private String lastDt;
   
   
   public UserVO(String email, String nick, String pwd, String userImg, Integer stusCd, String lastDt) {
      this.email = email;
      this.nick = nick;
      this.pwd = pwd;
      this.userImg = userImg;
      this.stusCd = stusCd;
      this.lastDt = lastDt;
   }
   
   public UserVO() {
      this("", "", "", "", 1, "");
   }
}

