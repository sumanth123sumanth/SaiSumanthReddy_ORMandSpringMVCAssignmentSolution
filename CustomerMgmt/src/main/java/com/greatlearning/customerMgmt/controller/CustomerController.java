package com.greatlearning.customerMgmt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.customerMgmt.model.Customer;
import com.greatlearning.customerMgmt.service.CustomerService;


@Controller
@RequestMapping("/customers")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/list")
	public String getAllCustomers(Model theModel) {
		List<Customer> res = customerService.getAllCustomers();
		theModel.addAttribute("customerModel", res);
		return "customerList";
	}
	
	@RequestMapping("/add")
	public String addCustomer(Model theModel) {
		Customer customer = new Customer();
		theModel.addAttribute("customer", customer);
		return "customersave";
	}
	
	@RequestMapping("/update")
	public String updateCustomer(@RequestParam("id") int id,Model theModel) {
		Customer customer = customerService.getCustomerById(id);
		theModel.addAttribute("customer", customer);
		return "customersave";
	}
	
	@RequestMapping("/delete")
	public String deleteCustomer(@RequestParam("id") int id) {
		Customer customer = customerService.delete(id);
		System.out.println("Deleted Customer Id"+ customer.getId());
		return "redirect:/customers/list";
	}
	
	@PostMapping("/save")
	public String saveCustomer(@RequestParam("id") int id, @RequestParam("firstname") String firstname,@RequestParam("lastname") String lastname,
			@RequestParam("email") String email) {
		Customer customer;
		if(id != 0) {
			customer = customerService.getCustomerById(id);
		}else {
			customer = new Customer();
		}
		customer.setFirstName(firstname);
		customer.setLastName(lastname);
		customer.setEmail(email);
		customerService.save(customer);
		return "redirect:/customers/list";
	}
}
