package kr.sanus.base1.controller;

import kr.sanus.base1.dto.BoardDTO;
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
    public String addForm(Model model) {
        model.addAttribute("board", new BoardDTO());
        return "board/addForm";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("board") BoardDTO boardDTO,
                      HttpSession session) {
        boardService.add(boardDTO, session);
        return "redirect:/board";
    }

    @GetMapping
    public String list(Model model) {
        List<BoardDTO> boards = boardService.findAll();
        model.addAttribute("boards", boards);
        return "board/list";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model) {
        model.addAttribute("board", boardService.findById(id));
        return "board/detail";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("board", boardService.findById(id));
        return "board/editForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id,
                       @ModelAttribute("board") BoardDTO boardDTO) {
        boardService.edit(id, boardDTO);
        return "redirect:/board/"+id;
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        boardService.delete(id);
        return "redirect:/board";
    }


}
