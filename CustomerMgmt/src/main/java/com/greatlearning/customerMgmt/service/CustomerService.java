package com.greatlearning.customerMgmt.service;

import java.util.List;

import com.greatlearning.customerMgmt.model.Customer;


public interface CustomerService {
	public List<Customer> getAllCustomers();
	public void save(Customer customer);
	public Customer delete(int id);
	public Customer getCustomerById(int id);
}
