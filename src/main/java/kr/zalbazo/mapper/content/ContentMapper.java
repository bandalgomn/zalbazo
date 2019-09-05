package kr.zalbazo.mapper.content;

import kr.zalbazo.model.content.Content;

import java.util.List;

public interface ContentMapper {
    void insert(Content content);
    Content read(Long contentId);
    List<Content> getList(Long CategoryId);
    int delete(Long contentId);
    int update(Content content);
}
