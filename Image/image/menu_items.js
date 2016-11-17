//<head><META http-equiv=Content-Type content="text/html; charset=utf-8"></head>
domMenu_data.setItem('menu_bin', new domMenu_Hash(
    1, new domMenu_Hash(
        'contents', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thông tin',
        'uri', '',
        'statusText', 'Thông tin',
        1, new domMenu_Hash(
            'contents', 'Văn bản - công văn',
            'uri', '/vanban/vb_nhan_danhsach.php',
            'statusText', 'Văn bản - công văn',
			1,new domMenu_Hash(
				'contents', 'Nhận văn bản',
				'uri', '/vanban/vb_nhan_danhsach.php',
				'statusText', 'Nhận văn bản'),
			2,new domMenu_Hash(
				'contents', 'Nhập mới văn bản',
				'uri', '/vanban/vb_thongtin_capnhat.php',
				'statusText','Cập nhật văn bản'),
			3,new domMenu_Hash(
				'contents', 'Quản lý văn bản',
				'uri', '/vanban/vb_quanly.php',
				'statusText','Quản lý thông tin văn bản')
        ),
        2, new domMenu_Hash(
            'contents', 'Tin nhắn',
            'uri', '../tt-tb/tt_ds.php',
            'statusText', 'Thông tin gởi đến cho bạn...',
			1,new domMenu_Hash(
				'contents', 'Nhận tin nhắn',
				'uri', '/tt-tb/tt_ds.php',
				'statusText', 'Nhận tin nhắn'),
			2,new domMenu_Hash(
				'contents', 'Gởi tin nhắn',
				'uri', '/tt-tb/tt_nhap.php',
				'statusText','Gởi tin nhắn cho mọi người..')
        ),
        3, new domMenu_Hash(
            'contents', 'Lịch làm việc',
            'uri', '/lich/lich_xem.php',
            'statusText', 'Lịch làm việc',
			1,new domMenu_Hash(
				'contents', 'Xem lịch, tạo lịch',
				'uri', '/lich/lich_xem.php',
				'statusText', 'Xem/tạo lịch trong tháng'),
			2,new domMenu_Hash(
				'contents', 'Quản lý lập lịch',
				'uri', '/lich/lich_capnhat.php',
				'statusText','Quản lý, cập nhật ghi nhớ')
        ),
        4, new domMenu_Hash(
            'contents', 'Lịch công tác..',
            'uri', '/nhansu/ns_congtac_xem.php',
            'statusText', 'Quản lý vắng mặt có lý do của các thành viên (Đi công tác, nghỉ phép, nghỉ tạm thời, đi du lịch...)',
			1,new domMenu_Hash(
				'contents', 'Danh sách',
				'uri', '/nhansu/ns_congtac_xem.php',
				'statusText', 'Xem danh sách thành viên vắng mặt..'),
			2,new domMenu_Hash(
				'contents', 'Nhập mới công tác',
				'uri', '/nhansu/ns_congtac_capnhat.php',
				'statusText','Nhập thành viên đi công tác'),
			3,new domMenu_Hash(
				'contents', 'Quản lý công tác',
				'uri', '/nhansu/ns_congtac_quanly.php',
				'statusText','Cập nhật các thay đổi công tác'),
			4,new domMenu_Hash(
				'contents', 'Quản lý tính chất',
				'uri', '/nhansu/ns_congtac_tinhchat_capnhat.php',
				'statusText','Quản lý, cập nhật tính chất công tác')
        ),
		5,new domMenu_Hash(
			'contents', 'Tìm kiếm',
			'uri', '/vanban/vb_timkiem.php',
			'statusText','Tìm kiếm văn bản')
    ),
    2, new domMenu_Hash(

        'contents', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Công việc',

        'uri', '',

        'statusText', 'Công việc',

			1,new domMenu_Hash(

				'contents', 'Theo dõi ',

				'uri', '',

				'statusText', ' Theo dõi',

		        1, new domMenu_Hash(

        		    'contents', 'Việc được giao',

		            'uri', '../cviec/cviec_duocgiao.php',

        	    'statusText', 'Việc được giao'

		        ),

				2,new domMenu_Hash(

					'contents', 'Việc đã giao',

        		    'uri', '../cviec/cviec_dagiao.php',

					'statusText','Việc đã giao')

			),		

			2,new domMenu_Hash(

					'contents', 'Giám sát công việc',

		            'uri', '',

					'statusText','Giám sát công việc',

		        1, new domMenu_Hash(

        		    'contents', 'Việc giao cho phòng',

		            'uri', '../cviec/cviec_giamsat.php',

        	    'statusText', 'Việc được giao'

		        ),

				2,new domMenu_Hash(

					'contents', 'Việc phòng giao',

        		    'uri', '../cviec/cviec_giamsat1.php',

					'statusText','Việc đã giao')

					

					

					),

			3,new domMenu_Hash(

					'contents', 'Tra cứu,thống kê',

		            'uri', '../cviec/cviec_tracuu.php',

					'statusText','Tra cứu, thống kê'),

			4,new domMenu_Hash(

					'contents', 'Khởi tạo việc',

		            'uri', '../cviec/cviec_khoitao.php',

					'statusText','Việc đã giao'),

			5,new domMenu_Hash(

					'contents', 'Nhập tính chất việc',

		            'uri', '../cviec/cviec_tinhchat.php',

					'statusText','Nhập tính chất công việc')

		

	   ),
    3, new domMenu_Hash(
        'contents', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thành viên',
        'uri', '',
        'statusText', 'Thành viên',
        1, new domMenu_Hash(
            'contents', 'Danh sách thành viên',
            'uri', '/nhansu/ns_nhanvien_xem.php',
            'statusText', 'Danh sách nhân viên trong hệ thống'
        ),
        2, new domMenu_Hash(
            'contents', 'Thông tin cá nhân',
            'uri', '/nhansu/ns_nhanvien_canhan.php',
            'statusText', 'Thông tin cá nhân của bạn'
        ),
        3, new domMenu_Hash(
            'contents', 'Thông tin truy cập',
            'uri', '/information.php',
            'statusText', 'Thông tin phiên làm việc của bạn'
        ),
        4, new domMenu_Hash(
            'contents', 'Sinh nhật',
            'uri', '/nhansu/ns_sinhnhat.php',
            'statusText', 'Tìm kiếm thông tin sinh nhật của các thành viên'
        )//,
    ),
    4, new domMenu_Hash(
        'contents', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Website',
        'uri', '',
        'statusText', 'Website',
        1, new domMenu_Hash(
            'contents', 'Website Bưu Điện',
            'uri', 'http://www.danangpt.vnn.vn',
            'statusText', 'Website Bưu Điện'
        )
    )
));

domMenu_settings.setItem('menu_bin', new domMenu_Hash(
    'menuBarWidth', '0%',
    'menuBarClass', 'bin_menuBar',//bin_menuBar
    'menuElementClass', 'bin_menuElement',//bin_menuElement
    'menuElementHoverClass', 'bin_menuElementHover',//bin_menuElementHover
    'menuElementActiveClass', 'bin_menuElementHover',//bin_menuElementHover
    'subMenuBarClass', 'bin_subMenuBar',//bin_subMenuBar
    'subMenuElementClass', 'bin_subMenuElement',//bin_subMenuElement
    'subMenuElementHoverClass', 'bin_subMenuElementHover',//bin_subMenuElementHover
    'subMenuElementActiveClass', 'bin_subMenuElementHover',//bin_subMenuElementHover
    'subMenuMinWidth', 'auto',
    'distributeSpace', false,
    'openMouseoverMenuDelay', 0,
    'openMousedownMenuDelay', 0,
    'closeClickMenuDelay', 200,
    'closeMouseoutMenuDelay', 500
));

/*
domMenu_data.setItem('menu_bin', new domMenu_Hash(
    1, new domMenu_Hash(
        'contents', 'Home',
        'uri', '',
        'statusText', 'Home',
        1, new domMenu_Hash(
            'contents', 'Main Page',
            'uri', 'http://www.example.com',
            'statusText', 'Mojave Page'
        ),
        2, new domMenu_Hash(
            'contents', 'Contact mojavelinux.com',
            'uri', '',
            'statusText', 'Contact mojavelinux.com',
            1, new domMenu_Hash(
                'contents', 'Dan',
                'uri', 'http://www.example.com',
                'statusText', 'Dan'
            ),
            2, new domMenu_Hash(
                'contents', 'Sarah',
                'uri', 'http://www.example.com',
                'statusText', 'Sarah'
            )
        ),
        3, new domMenu_Hash(
            'contents', 'Terms of Use',
            'uri', 'http://www.example.com',
            'statusText', 'Terms of Use'
        ),
        4, new domMenu_Hash(
            'contents', 'Search this site',
            'uri', 'http://www.example.com',
            'statusText', 'Search this site'
        ),
        5, new domMenu_Hash(
            'contents', 'Customize',
            'uri', '',
            'statusText', 'Customize',
            1, new domMenu_Hash(
                'contents', 'Style Schemas',
                'uri', '',
                'statusText', 'Style Schemas'
            ),
            2, new domMenu_Hash(
                'contents', 'Blue',
                'uri', 'http://example.com',
                'statusText', 'Blue'
            ),
            3, new domMenu_Hash(
                'contents', 'Green',
                'uri', 'http://example.com',
                'statusText', 'Green',
                1, new domMenu_Hash(
                    'contents', 'Green',
                    'uri', 'http://example.com',
                    'statusText', 'Green'
                )
            )
        )
    ),
    2, new domMenu_Hash(
        'contents', 'CSS',
        'uri', '',
        'statusText', 'CSS',
        1, new domMenu_Hash(
            'contents', 'Tutorials',
            'uri', '',
            'statusText', 'Tutorial Links'
        ),
        2, new domMenu_Hash(
            'contents', 'Using Stylesheets',
            'uri', 'http://www.example.com',
            'statusText', ''
        ),
        3, new domMenu_Hash(
            'contents', 'CSS Positioning',
            'uri', 'http://www.example.com',
            'statusText', 'Learning how to position elements with CSS'
        )
    ),
    3, new domMenu_Hash(
        'contents', 'JavaScript',
        'uri', '',
        'statusText', 'JavaScript Section',
        1, new domMenu_Hash(
            'contents', 'Tutorials',
            'uri', '',
            'statusText', 'JavaScript Tutorials'
        ),
        2, new domMenu_Hash(
            'contents', 'Custom Hash() Class',
            'uri', 'http://www.example.com',
            'statusText', 'Making your own associative arrays in javascript'
        )
    ),
    4, new domMenu_Hash(
        'contents', 'DHTML',
        'uri', '',
        'statusText', 'Dynamic HTML',
        1, new domMenu_Hash(
            'contents', 'Tutorials',
            'uri', '',
            'statusText', 'Dynamic HTML Tutorials'
        ),
        2, new domMenu_Hash(
            'contents', 'DOM Tooltip',
            'uri', 'http://www.example.com',
            'statusText', 'Making custom tooltips using the DOM'
        )
    ),
    5, new domMenu_Hash(
        'contents', 'PHP',
        'uri', '',
        'statusText', 'PHP Section',
        1, new domMenu_Hash(
            'contents', 'Tutorials',
            'uri', '',
            'statusText', 'PHP Tutorials'
        ),
        2, new domMenu_Hash(
            'contents', 'Handling actions',
            'uri', 'http://www.example.com',
            'statusText', 'Form actions in PHP'
        )
    )
));

*/