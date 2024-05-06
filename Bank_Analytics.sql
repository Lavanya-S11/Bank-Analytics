USE excelr_project_1;

select * from finance_1;
select * from finance2;

-- Q1. Year wise loan amount stats?
select year(issue_d) as years, sum(loan_amnt) as loan_amount from finance_1 group by years order by years desc;


-- Q2. Grade and Sub-grade wise revol bal?
select f1.grade, f1.sub_grade, sum(f2.revol_bal) as revol_balance from finance_1 as f1
                                        join finance2 as f2
                                        on f1.id = f2.id
                                        group by grade, sub_grade
                                        order by grade;
                                        
-- Q3. Total payment for verified status VS Total payment for Non-verified status? 
select f1.verification_status, round(sum(f2.total_pymnt)) as total_payment from finance_1 as f1
                                             join finance2 as f2
                                             on f1.id = f2.id
                                             where verification_status in('Verified','Not Verified')
                                             group by verification_status;
                                             
-- Q4. State wise and Last Credit pull date wise loan status? 
select f1.loan_status, date(f2.last_credit_pull_d) as month_wise_credit_pull_date, count(f1.addr_state) as addr_state from finance_1 as f1
                                                   join finance2 as f2
                                                   on f1.id = f2.id
                                                   group by loan_status, month_wise_credit_pull_date;
						
                                       
-- Q5. Home ownership VS last_payment_date_stats? 
select f1.home_ownership, date(f2.last_pymnt_d) as date_wise_last_pymnt_d, round(sum(total_pymnt))
										  from finance_1 as f1
                                          join finance2 as f2
                                          on f1.id = f2.id
                                          group by home_ownership, date_wise_last_pymnt_d;
										
									
										
								
                                       
                                      
