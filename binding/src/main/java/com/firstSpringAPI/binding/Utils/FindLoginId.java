package com.firstSpringAPI.binding.Utils;

public class FindLoginId {
    private static int loginId;

    public static void setLoginId(int creBy) {
        loginId = creBy;

    }

    public static int findLoginId() {

        return loginId;
    }
}
