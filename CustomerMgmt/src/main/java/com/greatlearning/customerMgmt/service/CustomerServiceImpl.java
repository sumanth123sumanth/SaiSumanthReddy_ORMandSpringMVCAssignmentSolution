package com.greatlearning.customerMgmt.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greatlearning.customerMgmt.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	SessionFactory sessionFactory;
	Session session;

	@Autowired
	public CustomerServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			this.session = sessionFactory.getCurrentSession();
		} catch (HibernateException he) {
			this.session = sessionFactory.openSession();
		}
	}

	@Override
	@Transactional
	public List<Customer> getAllCustomers() {
		@SuppressWarnings("unchecked")
		List<Customer> list = (List<Customer>) session.createQuery("from Customer").list();
		return list;
	}

	@Override
	public void save(Customer customer) {
		Transaction trx = session.beginTransaction();
		session.saveOrUpdate(customer);
		trx.commit();
	}

	@Override
	@Transactional
	public Customer delete(int id) {
		Transaction trx = session.beginTransaction();
		Customer customer = session.get(Customer.class, id);
		session.delete(customer);
		trx.commit();
		return customer;
	}

	@Override
	public Customer getCustomerById(int id) {
		return session.get(Customer.class, id);
	}

}
