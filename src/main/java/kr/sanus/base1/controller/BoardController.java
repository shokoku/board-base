package kr.sanus.base1.controller;

import kr.sanus.base1.dto.BoardDTO;
import kr.sanus.base1.dto.PagingDTO;
import kr.sanus.base1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/add")
    public String addForm(Model model,
                          @RequestParam(defaultValue = "1") int page,
                          @RequestParam(defaultValue = "10") int size) {
        model.addAttribute("board", new BoardDTO());
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        return "board/addForm";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("board") BoardDTO boardDTO,
                      @RequestParam(defaultValue = "10") int size,
                      HttpSession session) {
        boardService.add(boardDTO, session);
        return "redirect:/board?page=1&size=" + size;
    }

    @GetMapping
    public String list(@RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "10") int size,
                       Model model) {
        int totalCount = boardService.getTotalCount();
        PagingDTO pagingDTO = new PagingDTO(page, size ,totalCount);
        List<BoardDTO> boards = boardService.findAll(pagingDTO);

        model.addAttribute("boards", boards);
        model.addAttribute("pagingDTO", pagingDTO);

        return "board/list";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model,
                         @RequestParam(defaultValue = "1") int page,
                         @RequestParam(defaultValue = "10") int size) {
        model.addAttribute("board", boardService.findById(id));
        model.addAttribute("page", page);
        model.addAttribute("size", size);

        return "board/detail";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model,
                           @RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "10") int size) {
        model.addAttribute("board", boardService.findById(id));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        return "board/editForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id,
                       @ModelAttribute("board") BoardDTO boardDTO,
                       @RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "10") int size) {
        boardService.edit(id, boardDTO);
        return "redirect:/board/"+id + "?page=" + page + "&size=" + size;
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id,
                         @RequestParam(defaultValue = "1") int page,
                         @RequestParam(defaultValue = "10") int size) {
        boardService.delete(id);
        return "redirect:/board?page=" + page + "&size=" + size;
    }
}
