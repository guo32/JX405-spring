package com.bit.spring.controller;

import com.bit.spring.model.BoardDTO;
import com.bit.spring.model.UserDTO;
import com.bit.spring.service.BoardService;
import com.bit.spring.service.ReplyService;
import com.bit.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/board/")
public class BoardController {
    BoardService boardService;
    UserService userService;
    ReplyService replyService;

    @Autowired
    public BoardController(BoardService boardService, UserService userService, ReplyService replyService) {
        this.boardService = boardService;
        this.userService = userService;
        this.replyService = replyService;
    }

    @GetMapping("showAll/{pageNo}")
    public String showAll(Authentication authentication, Model model, @PathVariable int pageNo) {
        System.out.println(authentication.getName());
        System.out.println(authentication.getAuthorities());

        model.addAttribute("list", boardService.selectAll(pageNo));
        model.addAttribute("paging", setPages(pageNo, boardService.selectLastPage()));
        model.addAttribute("pagingAddr", "/board/showAll");

        return "board/showAll";
    }

    @GetMapping("showOne/{id}")
    public String showOne(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id) {
        if (session.getAttribute("login") == null) {
            redirectAttributes.addFlashAttribute("message", "다시 로그인해주세요.");
            return "redirect:/";
        }

        BoardDTO b = boardService.selectOne(id);
        if (b == null) {
            redirectAttributes.addFlashAttribute("message", "존재하지 않는 글 번호입니다.");
            return "redirect:/board/showAll/1";
        }

        model.addAttribute("result", b);
        // model.addAttribute("replyList", replyService.selectByBoardId(id));
        int loginId = ((UserDTO) session.getAttribute("login")).getId();
        model.addAttribute("loginId", loginId);
        return "/board/showOne";
    }

    @GetMapping("register")
    public String showRegister(HttpSession session, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("login") == null) {
            redirectAttributes.addFlashAttribute("message", "다시 로그인해주세요.");
            return "redirect:/";
        }
        return "/board/upsert";
    }

    @GetMapping("search/{pageNo}")
    public String search(String keyword, Model model, @PathVariable int pageNo) {
        Map<String, Object> map = boardService.selectByKeyword(keyword, pageNo);

        model.addAttribute("list", map.get("list"));
        model.addAttribute("pagingAddr", "/board/search/");
        model.addAttribute("keyword", keyword);
        model.addAttribute("paging", setPages(pageNo, boardService.countSearchResult(keyword)));

        return "/board/showAll";
    }

    private HashMap<String, Integer> setPages(int pageNo, int totalPage) {
        HashMap<String, Integer> paging = new HashMap<>();

        int start = 0;
        int end = 0;

        if (totalPage < 5) {
            start = 1;
            end = totalPage;
        } else if (pageNo < 3) {
            start = 1;
            end = 5;
        } else if (pageNo > totalPage - 3) {
            start = totalPage - 4;
            end = totalPage;
        } else {
            start = pageNo - 2;
            end = pageNo + 2;
        }

        paging.put("start", start);
        paging.put("end", end);
        paging.put("totalPage", totalPage);
        paging.put("current", pageNo);

        return paging;
    }

    @GetMapping("upsert/{id}")
    public String showUpsert(@PathVariable @Nullable int id) {
        System.out.println(id);
        return "/board/upsert";
    }

    @PostMapping("upsert")
    public String upsert(HttpSession session, String attemptId, BoardDTO boardDTO) {
        UserDTO login = (UserDTO) session.getAttribute("login");
        if (attemptId.matches("^\\d+$")) {
            boardDTO.setId(Integer.parseInt(attemptId));
            BoardDTO origin = boardService.selectOne(boardDTO.getId());
            origin.setTitle(boardDTO.getTitle());
            origin.setContent(boardDTO.getContent());

            boardService.update(origin);
        } else {
            boardDTO.setWriterId(login.getId());
            boardService.insert(boardDTO);
        }
        return "redirect:/board/showOne/" + boardDTO.getId();
    }

    @GetMapping("update/{id}")
    public String showUpdate(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id) {

        BoardDTO b = boardService.selectOne(id);
        if (session.getAttribute("login") == null) {
            redirectAttributes.addFlashAttribute("message", "다시 로그인해주세요.");
            return "redirect:/";
        }

//        if(b == null || b.getWriterId() != login.getId()) {
//            redirectAttributes.addFlashAttribute("message", "유효하지 않은 접근입니다.");
//            return "redirect:/board/showAll/1";
//        }

        model.addAttribute("board", b);

        return "/board/upsert";
    }

//
//    @GetMapping("delete/{id}")
//    public String deleteBoard(HttpSession session, RedirectAttributes redirectAttributes, @PathVariable int id) {
//        UserDTO login = (UserDTO) session.getAttribute("login");
//        if(login == null) {
//            redirectAttributes.addFlashAttribute("message", "다시 로그인해주세요.");
//            return "redirect:/";
//        }
//
//        BoardDTO b = boardService.selectOne(id);
//        if(b == null || b.getWriterId() != login.getId()) {
//            redirectAttributes.addFlashAttribute("message", "유효하지 않은 접근입니다.");
//            return "redirect:/board/showAll/1";
//        }
//
//        boardService.delete(id);
//
//        return "redirect:/board/showAll/1";
//    }
}


