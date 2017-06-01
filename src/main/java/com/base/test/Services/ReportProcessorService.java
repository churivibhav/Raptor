package com.base.test.Services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.DTO.ColumnInfoDTO;
import com.base.test.model.Users;

@Service("reportProcessorService")
public class ReportProcessorService {

	@Autowired
	ServiceInterface<Users> userService;

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public List<List<String>> fireReport(String query) {
		SQLQuery sqlQuery = getSession().createSQLQuery(query);
		List<Object[]> rows = sqlQuery.list();
		List<List<String>> data = new ArrayList<>();
		for (Object[] row : rows) {
			List<String> rowData = new ArrayList<>();
			for (int i = 0; i < row.length; i++) {
				rowData.add(row[i].toString());
			}
			data.add(rowData);
		}
		return data;
	}

	@Deprecated
	private List<ColumnInfoDTO> getColumnListFromString(String columns) {
		ArrayList<ColumnInfoDTO> res = new ArrayList<>();
		String[] data1 = columns.split(";");
		for (int i = 0; i < data1.length; i++) {
			String[] data2 = data1[i].split(",");
			ColumnInfoDTO cid = new ColumnInfoDTO(null, data2[0], data2[1]);
			res.add(cid);
		}
		return res;
	}

	/**
	 * Process specfic reports.
	 * 
	 * @param reportName
	 * @param results
	 * @return
	 */
	public ModelAndView processReport(String reportName, List<List<List<String>>> results) {
		switch (reportName) {
		case "Daily Reports":
			return processDailyReport(results);
		default:
			break;
		}
		return null;
	}

	private ModelAndView processDailyReport(List<List<List<String>>> results) {
		List<List<String>> userSellReport = getUserSellReport(results);
		System.out.println("UserSellReport: " + userSellReport);

		double cash = Double.parseDouble(userSellReport.get(userSellReport.size() - 1).get(1));
		double refundTotal = Double.parseDouble(userSellReport.get(userSellReport.size() - 1).get(6));
		double totalCash = cash - refundTotal;

		Map<String, Object> reportData = new HashMap<String, Object>();
		reportData.put("userSellReport", userSellReport);
		reportData.put("refundTotal", refundTotal);
		reportData.put("totalCash", totalCash);

		return new ModelAndView("dailySummary", "reportData", reportData);
	}

	private List<List<String>> getUserSellReport(List<List<List<String>>> results) {
		Map<String, List<String>> finalData = new HashMap<>();
		List<List<String>> userSellReport = new ArrayList<>();
		for (List<String> data : results.get(0)) {
			String userID = data.get(0);
			if (finalData.containsKey(userID)) {
				List<String> columns = finalData.get(userID);
				columns.add(data.get(2));
			} else {
				List<String> columns = new ArrayList<>();
				columns.add(userService.findByID(Long.parseLong(userID)).getUserName());
				columns.add(data.get(2));
				finalData.put(userID, columns);
			}
		}

		for (List<String> list : finalData.values()) {
			double total = 0.0;
			for (int i = 1; i < list.size(); i++) {
				double amount = Double.parseDouble(list.get(i));
				total += amount;
			}
			list.add("");
			list.add(Double.toString(total));
		}

		/**
		 * process refund.
		 */
		for (List<String> data : results.get(1)) {
			String userID = data.get(0);
			String refundString = data.get(1);
			refundString = Double.toString(Double.parseDouble(refundString) * -1);
			if (finalData.containsKey(userID)) {
				List<String> columns = finalData.get(userID);
				columns.add(refundString);
			} else {
				List<String> columns = new ArrayList<>();
				columns.add(userService.findByID(Long.parseLong(userID)).getUserName());
				columns.add(refundString);
				finalData.put(userID, columns);
			}
		}

		List<Object> total = new ArrayList<>();
		total.add("Total");
		total.add(0.0);
		total.add(0.0);
		total.add(0.0);
		total.add(0.0);
		total.add(0.0);
		total.add(0.0);

		Set<Entry<String, List<String>>> finalDataEntry = finalData.entrySet();
		for (Entry<String, List<String>> entry : finalDataEntry) {
			List<String> value = entry.getValue();
			addToTotal(value, total);
			userSellReport.add(value);
		}

		List<String> totalString = new ArrayList<>();
		for (Object value : total) {
			totalString.add(value.toString());
		}
		userSellReport.add(totalString);
		return userSellReport;
	}

	private void addToTotal(List<String> value, List<Object> total) {
		total.set(1, (double) total.get(1) + Double.parseDouble(value.get(1)));
		total.set(2, (double) total.get(2) + Double.parseDouble(value.get(2)));
		total.set(3, (double) total.get(3) + Double.parseDouble(value.get(3)));
		total.set(5, (double) total.get(5) + Double.parseDouble(value.get(5)));
		total.set(6, (double) total.get(6) + Double.parseDouble(value.get(6)));
	}
}
