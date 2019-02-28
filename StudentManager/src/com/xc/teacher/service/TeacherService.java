package com.xc.teacher.service;

import java.util.List;

import com.xc.page.PageBean;
import com.xc.teacher.domain.Teacher;

public interface TeacherService {

	public List<Teacher> findAll();

	public Teacher findById(String teacherId);

	public void updateTeacher(Teacher teacher);

	public PageBean<Teacher> findAll(Teacher teacher, int currentPage, int pageSize);
}
