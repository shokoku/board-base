package kr.sanus.base1.service;

import kr.sanus.base1.dto.User;
import kr.sanus.base1.exception.DuplicateUserIdException;
import kr.sanus.base1.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    public void join(User user) {
        try {
            userMapper.save(user);
        } catch (DuplicateKeyException e) {
            throw new DuplicateUserIdException("ID '" + user.getId() + "' is already taken.");
        }
    }

    public boolean login(@Param("id") String id,
                      @Param("pw") String pw,
                      HttpSession session) {
        boolean result = userMapper.authenticateUser(id, pw);
        if (result) {
            session.setAttribute("id", userMapper.findById(id).getId());
            return true;
        } else {
            return false;
        }
    }

    public User findById(String id) {
        return userMapper.findById(id);
    }

    public void update(User user) {
        userMapper.update(user);
    }

}
