package com.korea.k2.openApi;

import java.util.List;

public interface CompanyService {
	
	void insert(CompanyVO vo);
	void insertEv(EvSearchVO vo);
	
	EvSearchVO selectEvSearch(EvSearchVO vo);
	CompanyVO selectCompany(CompanyVO vo);
	List<CompanyVO> list(CompanyVO vo);
	List<EvSearchVO> listEv(EvSearchVO vo);
	

}
