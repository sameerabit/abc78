package com.boutique.abc78.controller;

import com.boutique.abc78.model.GoodReceiveNote;
import com.boutique.abc78.model.GoodReceiveNoteDetail;
import com.boutique.abc78.model.GoodReturnNoteDetail;
import com.boutique.abc78.service.GoodReceiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/grn")
public class GoodReceiveNoteRestController {

    @Autowired
    GoodReceiveService goodReceiveService;

    @RequestMapping(value="/save", method=RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public GoodReceiveNote store(@RequestBody GoodReceiveNote goodReceiveNote){
        if(goodReceiveNote.getId() != null){
            goodReceiveService.removeGoodReceiveNoteDetails(goodReceiveNote.getId());
        }
        for (GoodReceiveNoteDetail goodReceiveNoteDetail: goodReceiveNote.getGoodReceiveNoteDetail()) {
            goodReceiveNoteDetail.setGoodReceiveNote(goodReceiveNote);
        }
        GoodReceiveNote goodReceiveNote1 = goodReceiveService.save(goodReceiveNote);
        return goodReceiveNote1;
    }

    @RequestMapping(value="/show", method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public GoodReceiveNote show(@RequestParam Integer grnId){
        GoodReceiveNote goodReceiveNote = goodReceiveService.getGoodReceiveNote(grnId);
        return goodReceiveNote;
    }
}
