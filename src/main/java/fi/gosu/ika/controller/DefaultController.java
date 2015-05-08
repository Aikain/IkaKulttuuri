package fi.gosu.ika.controller;

import fi.gosu.ika.domain.Kulttuuri;
import fi.gosu.ika.repository.KulttuuriRepository;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/*")
public class DefaultController {

    @Autowired
    private KulttuuriRepository kulttuuriRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        model.addAttribute("kulttuurit", kulttuuriRepository.findAll());
        return "index";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String createKulttuuri(Kulttuuri kulttuuri) {
        kulttuuri.setTime(new Date(System.currentTimeMillis()));
        kulttuuriRepository.save(kulttuuri);
        return "redirect:index";
    }
}