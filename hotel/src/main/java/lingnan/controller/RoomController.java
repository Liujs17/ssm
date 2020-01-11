package lingnan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lingnan.pojo.Room;
import lingnan.service.RoomService;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/room")
public class RoomController{
	@Autowired
	private RoomService roomService;
	
	//查询所有
	 @RequestMapping("/list")
	 public String list(HttpServletRequest request){
		 List<Room> list = roomService.getList();
		 request.setAttribute("list", list);
	     return "forward:../room.jsp";		 
	 }
	@GetMapping("/getListJson")
	@ResponseBody
	 public List<Room> getListJson() {
        System.out.println("getListJson");
        return roomService.getList();
    }
 
	 //修改
	 @RequestMapping("/update")
	 public String update(HttpSession session,Room bean, Integer roomId){
			boolean flag= false;
			flag = roomService.update(bean);
			if(flag=false)
				return "success";
			System.out.println("update: "+flag);
			session.setAttribute("update", roomService.getList());
			System.out.println(bean);
		    return "redirect:list";
	 }
	
	 //更新
	 @RequestMapping("/delete")
	 public String delete(HttpSession session,Room bean,Integer roomId){
	     boolean flag = false;
	     flag = roomService.delete(roomId);
	     if(flag = false)
	    	 return "success";
	     System.out.println("delete: "+flag);
	     session.setAttribute("delete", roomService.getList());
	     System.out.println(bean);
		 return "room";
	 }
	 
	 @RequestMapping("/findById")
	    public String findById(@RequestParam(value = "roomId") Integer roomId, Model model) {
        System.out.println("roomId:" + roomId);
        Room room = roomService.getByRoomId(roomId);  
        model.addAttribute("room", room);
        return "forward:/result.jsp";
    }
	 
	 //通过房间类型进行模糊查询
	 @RequestMapping("/lists")
	 public String findByType(HttpSession session,String roomType,Room bean){
		 System.out.println("roomType:::"+roomType);
		 List<Room> lists =  roomService.getByType(bean);
	     session.setAttribute("lists", lists);
	     System.out.println(lists);
		 return "../../room";
	 }
	 
	 //增加room数据，并上传图片
	@RequestMapping("/save")
	public String upload(Room bean,HttpServletRequest request,Model model) throws IllegalStateException, IOException{
		System.out.println(request.getParameter("roomType"));
		//保存数据库路径
		String sqlPath = null;
		//定义文件保存的本地路径
		String localPath="E:\\upload\\";
		//定义文件名
		String filename = null;
		if(!bean.getFile().isEmpty()){
			//生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			//获得文件类型
			String contenType = bean.getFile().getContentType();
			//获取文件后缀
			String suffixName = contenType.substring(contenType.indexOf("/")+1);
			//得到文件名
			filename = uuid+"."+suffixName;
			System.out.println(filename);
			//保存文件路径
			bean.getFile().transferTo(new File(localPath+filename));
		  }
			sqlPath = filename;
			System.out.println(sqlPath);
			bean.setRoomId(Integer.parseInt(request.getParameter("roomId")));
			bean.setRoomType(request.getParameter("roomType"));
			bean.setRoomPrice(Integer.parseInt(request.getParameter("roomPrice")));
			bean.setRoomStock(Integer.parseInt(request.getParameter("roomStock")));
			bean.setImage(sqlPath);
			bean.setFormu(request.getParameter("formu"));
			roomService.save(bean);
			model.addAttribute("bean", bean);
			System.out.println(bean);
			return "redirect:list";
		}
	   
}
