package com.xc.student.domain;

import com.xc.profession.domain.Profession;

@SuppressWarnings("serial")
public class Student implements java.io.Serializable {

	/**
	 * ѧ����Ϣ
	 * @author Administrator
	 *
	 */
	
	private String studentId;
	
	private String name;			//����
	private String gender;			//�Ա�
	private Integer mustTuition;		//Ӧ��ѧ��	mustTuition
	private Integer actualTuition;		//ʵ��ѧ��
	
	private String telephone;		//�ֻ���
	private String identity;		//���֤��
	private String qq;				//QQ��
	private String email;			//����
	
	private String classes;			//�༶
	private String identityAddress;	//���֤��ַ
	private String address;			//�ھ���ַ
	
	private String remark;			//ѧԱ����
	private String homeTelephone;	//��ͥ��ϵ�绰
	private String homeContact;		//��ͥ��ϵ��
	
	private Profession profession;

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getMustTuition() {
		return mustTuition;
	}

	public void setMustTuition(Integer mustTuition) {
		this.mustTuition = mustTuition;
	}

	public Integer getActualTuition() {
		return actualTuition;
	}

	public void setActualTuition(Integer actualTuition) {
		this.actualTuition = actualTuition;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getClasses() {
		return classes;
	}

	public void setClasses(String classes) {
		this.classes = classes;
	}

	public String getIdentityAddress() {
		return identityAddress;
	}

	public void setIdentityAddress(String identityAddress) {
		this.identityAddress = identityAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getHomeTelephone() {
		return homeTelephone;
	}

	public void setHomeTelephone(String homeTelephone) {
		this.homeTelephone = homeTelephone;
	}

	public String getHomeContact() {
		return homeContact;
	}

	public void setHomeContact(String homeContact) {
		this.homeContact = homeContact;
	}

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	} 
	
	
}
