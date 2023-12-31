package kr.sanus.base1.mapper;

import kr.sanus.base1.entity.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface BoardMapper {
    void save(Board board);

    List<Board> findAll(@Param("offset") int offset, @Param("size") int size);

    List<Board> findAll(@Param("offset") int offset, @Param("size") int size, @Param("type") String type, @Param("keyword") String keyword);

    int getTotalCount(@Param("type") String type, @Param("keyword") String keyword);

    Optional<Board> findById(long id);

    void update(Board board);

    void delete(long id);

}
