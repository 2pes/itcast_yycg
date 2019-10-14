package app.base.pojo.po;

import java.io.Serializable;

public class UsergysareaKey implements Serializable {
    private String usergysid;

    private String areaid;

    private static final long serialVersionUID = 1L;

    public String getUsergysid() {
        return usergysid;
    }

    public void setUsergysid(String usergysid) {
        this.usergysid = usergysid == null ? null : usergysid.trim();
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid == null ? null : areaid.trim();
    }
}