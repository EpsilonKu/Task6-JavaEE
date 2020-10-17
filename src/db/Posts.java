package db;

import java.sql.Timestamp;

public class Posts {
    private Long id;
    private Users author;
    private String title;
    private String short_content;
    private String content;
    private Timestamp post_date;

    public Posts() {
    }

    public Posts(Long id, Users author, String title, String short_content, String content, Timestamp post_date) {
        this.id = id;
        this.author = author;
        this.title = title;
        this.short_content = short_content;
        this.content = content;
        this.post_date = post_date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Users getAuthor() {
        return author;
    }

    public void setAuthor(Users author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShort_content() {
        return short_content;
    }

    public void setShort_content(String short_content) {
        this.short_content = short_content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }
}