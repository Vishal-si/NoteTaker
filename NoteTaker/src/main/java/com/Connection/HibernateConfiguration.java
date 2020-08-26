package com.Connection;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateConfiguration 
{
	private static SessionFactory factory;
	
	
	public static SessionFactory getFactory()
	{
		if(factory == null)
		{
			factory =  new Configuration().configure("DatabaseConnection.xml").buildSessionFactory();			
		}
		return factory;
	}
	
	public void closeFactory()
	{
		factory.close();
	}

}
