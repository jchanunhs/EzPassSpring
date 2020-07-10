package control;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CreditCard;
import model.Customer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RechargeControl {

    @RequestMapping(value = "/RechargeControl", method = RequestMethod.POST)
    public ModelAndView Recharge(HttpServletRequest request, RedirectAttributes redirectAttributes, ModelAndView mv) {
        HttpSession session = request.getSession();
        String CID = (String) session.getAttribute("CID");
        String CN = request.getParameter("CardNumber");
        String NM = request.getParameter("Name");
        String EXPDate = request.getParameter("EXP");
        String CVV = request.getParameter("CVV");
        String Credit = request.getParameter("Credit");
        float Credit_FLT = Float.parseFloat(Credit);
        CreditCard card = new CreditCard(CN, NM, EXPDate, CVV, CID, Credit_FLT); // add payment information
        Customer cus = new Customer(CID); // get current balance
        cus.setData();//data set based on customer id
        float oldBal = cus.getBalance();
        float newBal = oldBal + Credit_FLT; //add the balance together
        mv.setViewName("redirect:/Recharge");
        if (cus.recharge(newBal) && card.addCreditCard()) {
            redirectAttributes.addFlashAttribute("message", "Recharge successfully! Your new balance is: " + newBal);
        } else {
            redirectAttributes.addFlashAttribute("message", "Error: Recharge failed unexpectly! If this occurs multiple times, please contact help desk.");
        }

        return mv;
    }

    @RequestMapping("/Recharge")
    public ModelAndView Recharge(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView mv = new ModelAndView();
        //check if user has logged in successfully AND created profile
        if (session.getAttribute("Username") == null && session.getAttribute("CID") == null) {
            mv.setViewName("redirect:/index");
        } else {
            CreditCard card = new CreditCard((String) session.getAttribute("CID"));
            ArrayList<String> CreditID_list = card.getAllTransactions("CreditID");
            ArrayList<String> CN_list = card.getAllTransactions("CardNumber");
            ArrayList<String> date_list = card.getAllTransactions("Date");
            ArrayList<String> time_list = card.getAllTransactions("Time");
            ArrayList<String> cd_amt = card.getAllTransactions("CreditAmount");
            mv.addObject("CreditID", CreditID_list);
            mv.addObject("CardNumber", CN_list);
            mv.addObject("Date", date_list);
            mv.addObject("Time", time_list);
            mv.addObject("CreditAmt", cd_amt);
            Customer cus = new Customer((String) session.getAttribute("CID"));
            cus.setData();
            mv.addObject("Balance", String.valueOf(cus.getBalance()));
            mv.setViewName("Recharge");
        }
        return mv;
    }

}
