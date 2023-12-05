```bash
# FLOWERSHOP_DND
#NHOM_36
#Thành_Viên:
    ---MSSV---      ---Họ Và Tên---       ---Lớp---
    N18DCCN047      Trần Anh Đức          D18CQIS01-N
    N18DCCN044      Nguyễn Minh Đoan      D18CQCP01-N
    N18DCCN128      Đỗ Văn Nam            D18CQCP01-N

#ĐỀ_TÀI: XÂY DỰNG PHẦN MỀM QUẢN LÝ SHOP HOA

*CHỨC_NĂNG:
- Xây dựng hệ thống với một trang Web quản lý và kinh doanh shop Hoa.
- Mô tả Nghiệp Vụ: 
    + Nghiệp vụ lưu trữ: 
          • Quản lý nhân viên
          • Quản lý shop hoa
          • Tạo, sửa, xóa các loại hoa, nhân viên
    + Nghiệp vụ tra cứu:
          • Tra cứu thông tin nhân viên
          • Tra cứu thông tin hoa
    + Nghiệp vụ tính toán, thống kê
          • Mua hoa
          • Lập thống kê chi tiết đơn hàng
*CÔNG_NGHỆ_SỬ_DỤNG:
    •	Ngôn ngữ Java để thực hiện chương trình
    •	Phần mềm Eclipse soạn thảo và thiết kế giao diện
    •	Phần mềm SQL Server để lưu trữ và kết nối dữ liệu
    •	Spring: Là một open source framework dành cho Java Enterprise. Core feature của Spring có thể dùng để xây dựng bất cứ Java application nào, các extensions của Spring có thể được sử dụng cho việc xây dựng web application trên nền tảng Java EE. Spring framework cũng hướng tới mục tiêu làm cho việc phát triển các ứng dụng trên nền tảng Java EE dễ dàng hơn và thúc đẩy việc lập trình tốt hơn bằng model POJO-based.
    •	Spring MVC: 
        Spring có xây dựng một cơ chế có tên Spring MVC mà ở đó có các API cho phép việc xây dựng ứng dụng web được dễ dàng hơn và chuẩn hơn. Chuẩn hơn thể hiện ở chỗ mọi thành phần được tạo ra, cài đặt và vận hành tuân theo một chuẩn thiết kế thống nhất.
        MVC lần lượt là ba chữ cái đầu tiên của ba từ Model, View và Controller. MVC là một mô hình ứng dụng mà ở đó các thành phần được phân tách ra thành các lớp riêng biệt với các nhiệm vụ đặc trưng.
          o	View sẽ là lớp cho các thành phần có chức năng hiển thị, giao tiếp trực tiếp với người dùng. Nhiệm vụ của các thành phần trong View là trình bày các dữ liệu từ Model đến người dùng cuối.
          o	Model là các thành phần có khả năng lưu trữ và vận chuyển thông tin. Quá trình gửi dữ liệu vào Model sẽ được thực hiện bởi Controller.
          o	Controller là các thành phần giúp cho việc xử lý logic các thao tác nghiệp vụ. Nhiệm vụ của Controller là lấy dữ liệu từ Model, xử lý dữ liệu, và cập nhật lại dữ liệu vào Model.
 
*CƠ_SỞ_DỮ_LIỆU[FLOWERSHOP_DND]
    - File: sqlQLShopHoa.sql
                └── [Admin]: Lưu trữ thông tin tài khoản Admin - Primary Key: [id]
                └── [Category]: Thông tin Loại Hoa - Primary Key: [id]
                └── [Color]: Lưu trữ thông tin màu sắc - Primary Key: [id]
                └── [Flower]: Lưu trữ thông tin hoa - Primary Key: [id]
                └── [Flower_Category]: Mối liên hệ Hoa_Loại - Primary Key: [idFlower] + [idColor]
                └── [Flower_Color]: Mối liên hệ Hoa_Màu Sắc - Primary Key: [idFlower] + [idCategory]
                └── [Order]: Lưu trữ thông tin chi tiết đơn hàng - Primary Key: [id]
                └── [ShopCart]: lưu trữ thông tin giỏ hàng - Primary Key: [id]
                └── [Transaction]: Lưu trữ thông tin đơn đặt hàng - Primary Key: [id]
                └── [User]: Lưu trữ thông tin tài khoản User - Primary Key: [id]
				
*PROJECT_FOLDER[FLOWERSHOP_DND]
│  README.md                                         #Giới thiệu tổng quan về project
│  sqlQLShopHoa.sql                                  #File scripts Cơ Sở Dữ Liệu   
└──[RestAPI]                                         #Project 
   │  pom.xml                                          
   └──[src]      
   │   └──[main]                                              #Chứa các file chính của project 
   │     └──[java]                                            #Chứa các file xử lý các chức năng vào ra DB và nghiệp vụ
   │        └──[shop]                           
   │           └──[bean]   
   │           └──[controller]         
   │           └──[dao] 
   │           └──[entity]
   │           └──[interceptor] 
   │           └──[service]                                                     
   └──[WebContent]                                            
      └──[META-INF] 
      └──[resources]                                          #Chứa các file xử lý giao diện và hình ảnh
      │  └──[admin] 
      │  └──[assets]
      │  └──[ckeditor] 
      │  └──[images] 
      └──[WEB-INF]                                            #Chứa các file cấu hình và giao diện đồ án
         └──[configs]
         └──[lib]
         └──[tags]
         └──[views]
         └──    Web.xml                                       #Cấu hình cần thiết cho project


*ĐÁNH_GIÁ_VÀ_CẢI_THIỆN_ỨNG_DỤNG:
    - Ứng dụng mang tính chất mô phỏng và đáp ứng nhu cầu môn học cũng như mua hoa ở phía người sử dụng.
    - Các chức năng cần cải thiện: chức năng liên kết mở rộng quy mô và sử dụng tối ưu, giao diện hợp lý cũng như phù hợp với nhu cầu người dử dụng.

```
# ThucTapTotNghiep
