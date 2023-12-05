package shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import shop.dao.TransactionDAO;
import shop.dto.ReportProductDto;
import shop.entity.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Transactional
@Controller
@RequestMapping("/admin/report")
public class ReportController {
	@Autowired
	private TransactionDAO transactionDAO;

	@RequestMapping(value="/transaction.htm", method= RequestMethod.GET)
	public String transaction(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");

		if (admin==null) {
			return "pages/error404";
		}
		String fromDate = request.getParameter("fromDate") == null ? "" : request.getParameter("fromDate");
		String toDate = request.getParameter("toDate") == null ? "" : request.getParameter("toDate");
		List<Transaction> transactionList = transactionDAO.searchTransactionByDate(fromDate, toDate);

		BigDecimal totalAmount = BigDecimal.ZERO;
		for (Transaction trans : transactionList) {
			totalAmount = totalAmount.add(trans.getAmount());
		}
		PagedListHolder pagedListHolder = new PagedListHolder(transactionList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(25);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("totalAmount", totalAmount);
		if (request.getParameter("fromDate") != null) {
			model.addAttribute("fromDate", request.getParameter("fromDate"));
		}
		if (request.getParameter("toDate") != null) {
			model.addAttribute("toDate", request.getParameter("toDate"));
		}

		return "admin/report-trans";
	}

	@RequestMapping(value="/product.htm", method= RequestMethod.GET)
	public String product(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");

		if (admin==null) {
			return "pages/error404";
		}
		String fromDate = request.getParameter("fromDate") == null ? "" : request.getParameter("fromDate");
		String toDate = request.getParameter("toDate") == null ? "" : request.getParameter("toDate");
		List<ReportProductDto> reportProductDtoList = transactionDAO.searchTransactionByProduct(fromDate, toDate);
		BigDecimal totalAmount = BigDecimal.ZERO;
		for (ReportProductDto reportProductDto : reportProductDtoList) {
			totalAmount = totalAmount.add(reportProductDto.getTotalAmount());
		}
		PagedListHolder pagedListHolder = new PagedListHolder(reportProductDtoList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		pagedListHolder.setPageSize(25);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("totalAmount", totalAmount);
		if (request.getParameter("fromDate") != null) {
			model.addAttribute("fromDate", request.getParameter("fromDate"));
		}
		if (request.getParameter("toDate") != null) {
			model.addAttribute("toDate", request.getParameter("toDate"));
		}

		return "admin/report-product";
	}
}
