package com.example.lab03.entity.Base;

import java.time.LocalDateTime;

public abstract class BasEntity {

    private LocalDateTime createAt;
    private LocalDateTime updateAt;
    private LocalDateTime deleteAt;
    private LocalDateTime createby;
    private LocalDateTime updateby;
    private LocalDateTime deleteby;
    private int status;

}
