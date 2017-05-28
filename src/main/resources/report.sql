Select * from CardHistory where transactionDate BETWEEN (Select startTime from DailyTransaction where businessDay = '2017-04-13') 
AND (Select endTime from DailyTransaction where businessDay = '2017-04-23');

/**
 * Get by payment mode.
 */
select userID, paymentMode, sum(a.cost) from 
(select b.tableNumber, b.charges, b.taxAmount, b.totalAmount, b.userID, p.paymentMode, p.cost 
from Bill b, Payments p where b.billID = p.billID and businessDay = '2017-04-23') a group by userID, paymentMode;

select b.tableNumber, b.charges, b.taxAmount, b.totalAmount, b.userID, p.paymentMode, p.cost, c.id
from Bill b, Payments p, CardHistory c where b.billID = p.billID and p.transactionID=c.id and b.usinessDay = '2017-04-23'

/**
 * Get refund amount.
 */
select userID,sum(amount) from CardHistory where transactionDate BETWEEN (Select startTime from DailyTransaction where businessDay = '2017-04-13') 
AND (Select endTime from DailyTransaction where businessDay = '2017-04-23') and transactionType='REFUND' group by userID;
