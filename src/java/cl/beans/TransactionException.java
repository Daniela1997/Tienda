/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.beans;

import javax.ejb.ApplicationException;

/**
 *
 * @author Daniela
 */
@ApplicationException(rollback = true)
public class TransactionException extends Exception{
    public  TransactionException(){
    super();
}
}
