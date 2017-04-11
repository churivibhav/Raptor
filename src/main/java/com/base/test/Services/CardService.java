package com.base.test.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.test.DAO.CardsDAO;
import com.base.test.DAO.DaoInterface;
import com.base.test.enums.TransactionType;
import com.base.test.model.CardHistory;
import com.base.test.model.Cards;

@Service("cardService")
public class CardService extends AbstractService<Cards> {

	@Autowired
	private CardsDAO cardDAO;

	@Autowired
	private ServiceInterface<CardHistory> cardHistoryService;

	@Override
	public DaoInterface<Cards> getEntityDAO() {
		return cardDAO;
	}

	public Cards getByName(String userName) {
		return cardDAO.getByName(userName);
	}

	@Override
	public List<Cards> getActiveEntity() {
		return cardDAO.getActiveEntity();
	}

	@Override
	public long addToCardHistory(Cards card, Double amount, Double balance, TransactionType transactionType) {
		CardHistory cardHistory = new CardHistory();
		cardHistory.setCardNumber(card.getCardNumber());
		cardHistory.setTransactionType(transactionType.getId());
		cardHistory.setAmount(amount);
		cardHistory.setBalance(balance);
		return cardHistoryService.create(cardHistory);
	}
}