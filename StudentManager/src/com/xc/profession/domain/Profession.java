package com.xc.profession.domain;

import java.util.HashSet;
import java.util.Set;

import com.xc.department.domain.Department;
import com.xc.student.domain.Student;

public class Profession {

	private String professionId;
	private String name;
	private String classes;
	
	private Set<Student> sutdentSet = new HashSet<Student>();

	private Department department;

	public String getProfessionId() {
		return professionId;
	}

	public void setProfessionId(String professionId) {
		this.professionId = professionId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClasses() {
		return classes;
	}

	public void setClasses(String classes) {
		this.classes = classes;
	}

	public Set<Student> getSutdentSet() {
		return sutdentSet;
	}

	public void setSutdentSet(Set<Student> sutdentSet) {
		this.sutdentSet = sutdentSet;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	
}
