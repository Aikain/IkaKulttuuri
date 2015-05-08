package fi.gosu.ika.domain;

import java.util.Date;
import javax.persistence.Entity;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
public class Kulttuuri extends AbstractPersistable<Long> {

    private Date time;
    private int kpl;
    private Long userId;

    public Kulttuuri(int kpl, Long userId) {
        this.time = new Date(System.currentTimeMillis());
        this.kpl = kpl;
        this.userId = userId;
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

}
