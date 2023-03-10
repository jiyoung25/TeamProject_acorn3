package com.team.project.users.service;

public interface JwtService {
    public String createToken(String subject, long time);
    // 토큰 해독
    public String getSubject(String token);
    public boolean isUsable(String jwt);
}
