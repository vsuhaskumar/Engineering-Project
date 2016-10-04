package com.paillier;

import java.math.*;
import java.util.*;

/* CLASS FOR PAILLIER ALGORITHM */

public class Paillier 
{	
	private BigInteger p, q;

	private  BigInteger lambda;
	
	public  BigInteger n;
	
	public  BigInteger nsquare;
	
	private  BigInteger g;
	
	private  int bitLength;
	
		public Paillier(int bitLengthVal, int certainty) 
		{
			KeyGeneration(bitLengthVal, certainty);
		}
		
	
		public Paillier()
		{
			KeyGeneration(512, 64);
		}
	
		/* METHOD FOR KEY GENERATION */
	
		public void KeyGeneration(int bitLengthVal, int certainty) 
		{
			bitLength = bitLengthVal;
			String a=GetProperty.getProperty("p");
			String b=GetProperty.getProperty("q");
			p=new BigInteger(a);
			q=new BigInteger(b);
			System.out.println("p  "+p);
			System.out.println("q  "+q);			
			n = p.multiply(q);
			nsquare = n.multiply(n);
			System.out.println("n  "+n);			
			g = new BigInteger("2");
			System.out.println("g  "+g);
			lambda = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE)).divide(
			p.subtract(BigInteger.ONE).gcd(q.subtract(BigInteger.ONE)));			
			System.out.println("lamda  "+lambda);
			if (g.modPow(lambda, nsquare).subtract(BigInteger.ONE).divide(n).gcd(n).intValue() != 1)
			{
				System.out.println("g is not good. Choose g again.");
				System.exit(1);
			}
		}
	
	/**
	* Encrypts plaintext m. ciphertext c = g^m * r^n mod n^2. This function explicitly requires random input r to help with encryption.
	* @param m plaintext as a BigInteger
	* @param r random plaintext to help with encryption
	* @return ciphertext as a BigInteger
	*/
		public BigInteger Encryption(BigInteger m, BigInteger r) 
		{
			return g.modPow(m, nsquare).multiply(r.modPow(n, nsquare)).mod(nsquare);
		}
	
	/**
	* Encrypts plaintext m. ciphertext c = g^m * r^n mod n^2. This function automatically generates random input r (to help with encryption).
	* @param m plaintext as a BigInteger
	* @return ciphertext as a BigInteger
	*/
	
	/* METHOD FOR PAILLIER ENCRPTION ALGORITHM */		
		
	public  BigInteger Encryption(BigInteger m)
	{
		BigInteger r = new BigInteger(bitLength, new Random());
		System.out.println("r  "+r);	
		System.out.println("result(encry)  "+g.modPow(m, nsquare).multiply(r.modPow(n, nsquare)).mod(nsquare));
		return g.modPow(m, nsquare).multiply(r.modPow(n, nsquare)).mod(nsquare);
		
		
	}
	
	/**
	* Decrypts ciphertext c. plaintext m = L(c^lambda mod n^2) * u mod n, where u = (L(g^lambda mod n^2))^(-1) mod n.
	* @param c ciphertext as a BigInteger
	* @return plaintext as a BigInteger
	*/
	
	/* METHOD FOR PAILLIER DECRPTION ALGORITHM */
	
	public  BigInteger Addition(BigInteger em1,BigInteger em2) 
	{
		BigInteger c = em1.multiply(em2).mod(nsquare);
		BigInteger u = g.modPow(lambda, nsquare).subtract(BigInteger.ONE).divide(n).modInverse(n);
		return c.modPow(lambda, nsquare).subtract(BigInteger.ONE).divide(n).multiply(u).mod(n);
		
	}
	
	public  BigInteger Decryption(BigInteger em1,BigInteger em2) 
	{
		BigInteger c = em1.multiply(em2).mod(nsquare);
		BigInteger u = g.modPow(lambda, nsquare).subtract(BigInteger.ONE).divide(n).modInverse(n);
		return c.modPow(lambda, nsquare).subtract(BigInteger.ONE).divide(n).multiply(u).mod(n);
	}
	
	
	
	
	/**
	* main function
	* @param str intput string
	*/
	public static void main(String[] str) 
	{

		Paillier paillier = new Paillier();
		
	}
}
 