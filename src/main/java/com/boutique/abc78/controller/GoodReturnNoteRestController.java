package com.boutique.abc78.controller;

import com.boutique.abc78.model.GoodReturnNote;
import com.boutique.abc78.model.GoodReturnNoteDetail;
import com.boutique.abc78.service.GoodReturnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/return")
public class GoodReturnNoteRestController {

    @Autowired
    GoodReturnService goodReturnService;

    @RequestMapping(value="/save", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public GoodReturnNote store(@RequestBody GoodReturnNote goodReturnNote){
        if(goodReturnNote.getId() != null){
            goodReturnService.removeGoodReturnNoteDetails(goodReturnNote.getId());
        }
        for (GoodReturnNoteDetail goodReturnNoteDetail: goodReturnNote.getGoodReturnNoteDetail()) {
            goodReturnNoteDetail.setGoodReturnNote(goodReturnNote);
        }
        GoodReturnNote goodReturnNote1 = goodReturnService.save(goodReturnNote);
        return goodReturnNote1;
    }

    @RequestMapping(value="/show", method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public GoodReturnNote show(@RequestParam Integer grnId){
        GoodReturnNote goodReturnNote = goodReturnService.getGoodReturnNote(grnId);
        return goodReturnNote;
    }
}
