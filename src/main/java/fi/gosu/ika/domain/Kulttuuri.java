package fi.gosu.ika.domain;

import java.util.Date;
import javax.persistence.Entity;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class Kulttuuri{

    @Id
    private Long id;
    private Date time;
    private int kpl;
    private Long userId;
    private String user;

    public Kulttuuri() {
        this.time = new Date(System.currentTimeMillis());
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getKpl() {
        return kpl;
    }

    public void setKpl(int kpl) {
        this.kpl = kpl;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}
