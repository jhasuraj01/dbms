Write a PL/SQL block to implement concept of cursors on following table:
 Employee(Employee_Id, Lastname,  Firstname, Middlename, Job_Id, Manager_Id,  Hiredate,  Credit_Limit,	 Department_Id)
Consider the level of customer based on credit limit as given in example and set the proper status
eg. Credit_Limit > 50000 level is PLATINUM
    Credit_Limit <= 50000 and >= 10000 level is GOLD
    Credit_Limit < 10000 level is SILVER
