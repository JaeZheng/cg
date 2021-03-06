package scut.legend.cg.controller;

import static org.junit.Assert.*;

import java.util.HashMap;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.alibaba.fastjson.JSON;

import scut.legend.cg.po.Product;
import scut.legend.cg.po.ProductModelInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:spring/spring-*.xml"})
public class WarehouseProductInventoryControllerTest {

	@Autowired
	private WebApplicationContext wac;
	 
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();  
	}
	
	@Test
	public void test() throws Exception {
//		String requestJson = "{\"productSize\":\"2\"}";
		Product product = new Product();
		ProductModelInfo productModelInfo = new ProductModelInfo();
		productModelInfo.setProductModel("1");
		product.setProductSize("1");
//		product.setProductModelInfo(productModelInfo);
		product.setProductShape('1');
		String requestJson = JSON.toJSONString(product);
		
		MvcResult result=mockMvc.perform(MockMvcRequestBuilders.post("/WarehouseProductInventory").contentType(MediaType.APPLICATION_JSON)
				.content(requestJson)).andReturn();
		MockHttpServletResponse response=result.getResponse();
		System.out.println(response.getContentAsString());
	}

}
