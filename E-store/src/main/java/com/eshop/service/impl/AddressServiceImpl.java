package com.eshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.AddressDAO;
import com.eshop.model.Address;
import com.eshop.service.AddressService;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {

	@Autowired
	public AddressDAO addressDAO;

	public Address findAddressById(int id) {
		return addressDAO.findAddressById(id);
	}

	public void save(Address address) {
		addressDAO.save(address);
	}

	public void edit(Address address) {
		addressDAO.edit(address);
	}

	public void delete(Address address) {
		addressDAO.delete(address);
	}

}
