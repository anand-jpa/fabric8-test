package com.eshop.service;

import com.eshop.model.Address;

public interface AddressService {

	public Address findAddressById(int id);

	public void save(Address address);

	public void edit(Address address);

	public void delete(Address address);

}
