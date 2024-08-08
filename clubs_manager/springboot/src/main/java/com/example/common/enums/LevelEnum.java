package com.example.common.enums;

public enum LevelEnum {

    HEADER("社长"),
    STUDENT("学生"),
    ;
    public String lever;

    //右键-Generate-Constructor
    LevelEnum(String lever) {
        this.lever = lever;
    }
}
