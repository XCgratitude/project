package com.xc.department.domain;

import java.util.HashSet;
import java.util.Set;

import com.xc.profession.domain.Profession;
import com.xc.teacher.domain.Teacher;

public class Department {

	private String departmentId;
	
	private String name;
	
	private Set<Teacher> teacherSet = new HashSet<Teacher>();
	
	private Set<Profession> professionSet = new HashSet<Profession>();

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Teacher> getTeacherSet() {
		return teacherSet;
	}

	public void setTeacherSet(Set<Teacher> teacherSet) {
		this.teacherSet = teacherSet;
	}

	public Set<Profession> getProfessionSet() {
		return professionSet;
	}

	public void setProfessionSet(Set<Profession> professionSet) {
		this.professionSet = professionSet;
	}

}
