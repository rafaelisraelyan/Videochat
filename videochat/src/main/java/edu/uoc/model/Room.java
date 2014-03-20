/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.uoc.model;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "VC_ROOM")
public class Room implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "ROOM_ID", unique = true, length = 11)
    private int id;

    @ManyToOne(targetEntity = Course.class)
    @JoinColumn(name = "COURSE_ID")
    private int id_course;

    @Column(name = "COURSE_KEY", length = 150)
    private String key;

    @Column(name = "COURSE_LABEL", length = 250)
    private String label;

    @Column(name = "COURSE_IS_BLOCKED")
    private boolean is_blocked;

    @Column(name = "COURSE_REASON_BLOCKED", length = 250)
    private String reason_blocked;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "id_room")
    private List<MeetingRoom> meetingRoom;

    public List<MeetingRoom> getMeetingRoom() {
        return meetingRoom;
    }

    public void setMeetingRoom(List<MeetingRoom> meetingRoom) {
        this.meetingRoom = meetingRoom;
    }

    public Room() {
    }

    public Room(int id, int id_course, String key, String label, boolean is_blocked, String reason_blocked, List<MeetingRoom> meetingRoom) {
        this.id = id;
        this.id_course = id_course;
        this.key = key;
        this.label = label;
        this.is_blocked = is_blocked;
        this.reason_blocked = reason_blocked;
        this.meetingRoom = meetingRoom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public boolean isIs_blocked() {
        return is_blocked;
    }

    public void setIs_blocked(boolean is_blocked) {
        this.is_blocked = is_blocked;
    }

    public String getReason_blocked() {
        return reason_blocked;
    }

    public void setReason_blocked(String reason_blocked) {
        this.reason_blocked = reason_blocked;
    }

}
