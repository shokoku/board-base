package kr.sanus.base1.mapper;

import kr.sanus.base1.entity.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface BoardMapper {
    void save(Board board);

    List<Board> findAll();

    Optional<Board> findById(long id);

    void update(Board board);

    void delete(long id);

}
