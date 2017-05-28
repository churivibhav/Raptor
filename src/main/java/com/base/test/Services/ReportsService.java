package com.base.test.Services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.base.test.DAO.DaoInterface;
import com.base.test.DAO.ReportsDAO;
import com.base.test.DTO.ColumnInfoDTO;
import com.base.test.model.Reports;

@Service("reportsService")
public class ReportsService extends AbstractService<Reports> {

	@Autowired
	private ReportsDAO reportsDAO;

	@Override
	public DaoInterface<Reports> getEntityDAO() {
		return reportsDAO;
	}

	@Transactional
	public List<List<String>> fireReport(String query) {
		SQLQuery sqlQuery = reportsDAO.getSession().createSQLQuery(query);
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

		Map<String, Object> reportData = new HashMap<String, Object>();
		reportData.put("reportData", reportData);

		return new ModelAndView("dailySummary", "reportData", reportData);
	}

	private List<List<String>> getUserSellReport(List<List<List<String>>> results) {
		Map<String, List<String>> finalData = new HashMap<>();
		List<List<String>> userSellReport = new ArrayList<>();
		int columnCounter = 1;
		for (List<String> data : results.get(0)) {
			columnCounter++;
			String userID = data.get(0);
			if (finalData.containsKey(userID)) {
				List<String> columns = finalData.get(userID);
				columns.add(data.get(2));
			} else {
				List<String> columns = new ArrayList<>();
				columns.add(userID);
				columns.add(data.get(2));
				finalData.put(userID, columns);
			}
		}

		for (List<String> list : finalData.values()) {
			double total = 0.0;
			for (String amountString : list) {
				double amount = Double.parseDouble(amountString);
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
				columns.add(userID);
				columns.add(refundString);
				finalData.put(userID, columns);
			}
		}

		Set<Entry<String, List<String>>> finalDataEntry = finalData.entrySet();
		for (Entry<String, List<String>> entry : finalDataEntry) {
			userSellReport.add(entry.getValue());
		}
		return userSellReport;
	}
}