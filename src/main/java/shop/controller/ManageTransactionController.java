package shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import shop.dao.OrderDAO;
import shop.dao.StorageDAO;
import shop.dao.TransactionDAO;
import shop.entity.*;
import shop.service.ShopService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/transaction")
public class ManageTransactionController {
	@Autowired
	private TransactionDAO transactionDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private StorageDAO storageDAO;

	@RequestMapping(value="", method= RequestMethod.GET)
	public String home(ModelMap model, HttpServletRequest request) {
		System.out.println("Load admin transaction");
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");

		if (admin == null) {
			return "pages/error404";
		}
		List<Transaction> transactionList = transactionDAO.getListTransOrderByDate();
		PagedListHolder pagedListHolder = new PagedListHolder(transactionList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("currentPage", page);
		return "admin/transaction";
	}

	@RequestMapping(value = "/approval.htm", method = RequestMethod.GET)
	public String approvalTrans(ModelMap model, HttpServletRequest request) {
		System.out.println("Approval status trans");
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");
		if (admin == null) {
			return "pages/error404";
		}
		int idTrans = Integer.parseInt(request.getParameter("transId"));
		Transaction trans = transactionDAO.getTransById(idTrans);
		int newStatus = 0;
		if (trans.getStatus() == 1) {
			newStatus = 2;
		} else if (trans.getStatus() == 4) {
			newStatus = 5;
		}
		if (newStatus <= 0) {
			return "pages/error404";
		}
		trans.setStatus(newStatus);
		transactionDAO.update(trans);

		List<Transaction> transactionList = transactionDAO.getListTransOrderByDate();
		PagedListHolder pagedListHolder = new PagedListHolder(transactionList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("currentPage", page);
		return "admin/transaction";
	}

	@RequestMapping(value="/cancel.htm",method = RequestMethod.GET)
	public String cancelTrans(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");
		if (admin == null) {
			return "pages/error404";
		}

		int idTrans = Integer.parseInt(request.getParameter("transId"));
		Transaction trans = transactionDAO.getTransById(idTrans);
		trans.setStatus(6);
		trans.setDoneDate(new Date());
		boolean res = transactionDAO.createOrUpdate(trans);
		if (!res) {
			return "pages/error404";
		}

		List<Transaction> transactionList = transactionDAO.getListTransOrderByDate();
		PagedListHolder pagedListHolder = new PagedListHolder(transactionList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		model.addAttribute("currentPage", page);
		return "admin/transaction";
	}

	@RequestMapping(value="/confirm.htm",method = RequestMethod.GET)
	public String confirm(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");
		if (admin == null) {
			return "pages/error404";
		}

		int idTrans = Integer.parseInt(request.getParameter("transId"));
		Transaction trans = transactionDAO.getTransById(idTrans);
		trans.setStatus(3);
		trans.setDoneDate(new Date());
		transactionDAO.createOrUpdate(trans);
		List<Order> orders = orderDAO.getListOrderByTrans(idTrans);
		for (Order order : orders) {
			order.setStatus(true);
			orderDAO.createOrUpdate(order);

			Storage storage = new Storage();
			storage.setFlower(order.getFlower());
			storage.setQuantityIn(order.getQuantity());
			storage.setLast(true);
			storage.setSell(true);
			storageDAO.createOrUpdate(storage);
		}

		List<Transaction> transactionList = transactionDAO.getListTransOrderByDate();
		PagedListHolder pagedListHolder = new PagedListHolder(transactionList);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(2);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/transaction";
	}

	@RequestMapping(value = "/view/{idTrans}.htm", method = RequestMethod.GET)
	public String view(ModelMap model, @PathVariable("idTrans") int idTrans, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminLogin");
		if (admin == null) {
			return "pages/error404";
		}

		Transaction trans = transactionDAO.getTransById(idTrans);
		List<Order> orders = orderDAO.getListOrderByTrans(idTrans);

		model.addAttribute("subTotal1",ShopService.subTotal1(orders));
		model.addAttribute("ship1",ShopService.ship1(orders));
		model.addAttribute("trans", trans);
		model.addAttribute("orders", orders);
		return "admin/detail_transaction";
	}
}
