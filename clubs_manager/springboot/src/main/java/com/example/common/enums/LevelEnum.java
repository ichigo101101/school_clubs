package com.example.common.enums;

public enum LevelEnum {

    HEADER("社长"),
    STUDENT("学生"),
    ;
    public String level;


    //右键-Generate-Constructor
    LevelEnum(String level) {
        this.level = level;
    }

//    public String getLevel() {
//        return level;
//    }
//
//    public void setLevel(String level) {
//        this.level = level;
//    }
}
