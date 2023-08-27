package kr.sanus.base1.mapper;


import kr.sanus.base1.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    User findById(String id);

    void save(User user);

    void update(User user);

    boolean authenticateUser(@Param("id") String id, @Param("pw") String pw);

}
