package fi.gosu.ika.controller;

import fi.gosu.ika.domain.Kulttuuri;
import fi.gosu.ika.repository.KulttuuriRepository;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
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
        List<Kulttuuri> kulttuurit = kulttuuriRepository.findAll();
        Collections.sort(kulttuurit, new Comparator<Kulttuuri>() {
            @Override
            public int compare(Kulttuuri o1, Kulttuuri o2) {
                return o1.getTime().compareTo(o2.getTime());
            }
        });
        model.addAttribute("kulttuurit", kulttuuriRepository.findAll());
        return "index";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String createKulttuuri(Kulttuuri kulttuuri) {
        kulttuuriRepository.save(kulttuuri);
        return "redirect:index";
    }
}
