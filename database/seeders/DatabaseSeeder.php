<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $databases = [
            [
                'table' => 'roles',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Quản trị viên',
                    ],
                    [
                        'id' => 2,
                        'name' => 'Nhân Viên',
                    ],
                    [
                        'id' => 3,
                        'name' => 'Khách hàng',
                    ]
                ],
            ],
            [
                'table' => 'users',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Admin',
                        'email' => 'admin@gmail.com',
                        'password' => Hash::make('password'),
                        'email_verified_at' => now(),
                        'phone_number' => '0000000000',
                        'active' => 1,
                        'role_id' => 1
                    ]
                ]
            ],
            [
                'table' => 'brands',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Nike'
                    ],
                    [
                        'id' => 2,
                        'name' => 'Gucci'
                    ],
                    [
                        'id' => 3,
                        'name' => 'Adidas'
                    ],
                ]
            ],
            [
                'table' => 'categories',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Giày Nam',
                        'parent_id' => 0,
                        'slug' => 'giay-nam'
                    ],
                    [
                        'id' => 2,
                        'name' => 'Giày Nữ',
                        'parent_id' => 0,
                        'slug' => 'giay-nu'
                    ],

                ]
            ],
            [
                'table' => 'payments',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Khi nhận hàng',
                        'status' => 1,
                        'img' => '1682960154.png',
                    ],
                    [
                        'id' => 2,
                        'name' => 'Ví điện tử Momo',
                        'status' => 1,
                        'img' => '1682960202.png',
                    ],
                    [
                        'id' => 3,
                        'name' => 'Ví điện tử VNPay',
                        'status' => 1,
                        'img' => '1694970935.png',
                    ],
                ]
            ],
            [
                'table' => 'colors',
                'data' => [
                    [
                        'id' => 1,
                        'name' => 'Trắng'
                    ],
                    [
                        'id' => 2,
                        'name' => 'Đen'
                    ],
                    [
                        'id' => 3,
                        'name' => 'Xám'
                    ],

                ]
            ],
            [
                'table' => 'sizes',
                'data' => [
                    [
                        'id' => 1,
                        'name' => '30'
                    ],
                    [
                        'id' => 2,
                        'name' => '31'
                    ],
                    [
                        'id' => 3,
                        'name' => '32'
                    ],
                    [
                        'id' => 4,
                        'name' => '33'
                    ],
                ]
            ],
            [
                'table' => 'setting',
                'data' => [
                    [
                        'id' => 1,
                        'logo' => 'logo.png',
                        'name' => 'zawnhieu',
                        'email' => 'zawnhieu@gmail.com',
                        'address' => 'Bắc Từ Liêm, Hà Nội',
                        'phone_number' => '0705668825',
                        'maintenance' => 2,
                        'notification' => '<b>WEBSITE tạm thời bảo trì để nâng cấp xin  quay lại sau</b>',
                        'introduction' => '
    <h3 style="text-align: center;">
        <b>GIỚI THIỆU VỀ FLATSHOP</b>
    </h3><h5><br></h5><h5><span style="font-family: " source="" sans="" pro";"="" times="" new="" roman"; "="">
        Chào mừng đến với website bán giày của chúng tôi!
        Chúng tôi tự hào là một trong những cửa hàng trực tuyến hàng đầu về giày dép,
        cung cấp cho khách hàng những sản phẩm giày chất lượng cao và đa dạng.
    </span><br></h5><h5><br></h5><h5>
        Đối với chúng tôi, giày không chỉ là một phụ kiện mà là một phần quan trọng trong phong cách và cá tính.
        Chúng tôi cung cấp các sản phẩm giày thời trang với thiết kế đẹp và độ bền cao, mang đến cho bạn sự thoải mái và phong cách.
        Mỗi sản phẩm đều được chọn lựa kỹ càng để đảm bảo chất lượng và sự hài lòng của khách hàng.
    <br></h5><h5><br></h5><h5>
        Chúng tôi cam kết chỉ bán các sản phẩm giày làm từ chất liệu tốt nhất,
        đảm bảo độ bền cao và giá trị sử dụng lâu dài. Mỗi đôi giày đều được kiểm tra kỹ lưỡng trước khi đến tay khách hàng,
        đáp ứng các tiêu chuẩn chất lượng mà chúng tôi đặt ra.
    <br></h5><h5><br></h5><h5>
        Cửa hàng luôn cập nhật những mẫu giày mới nhất, từ giày thể thao năng động, giày sneaker cá tính đến giày da lịch lãm.
        Chúng tôi cung cấp các lựa chọn đa dạng để bạn dễ dàng tìm thấy đôi giày phù hợp với phong cách của mình.
    <br></h5><h5><br></h5><h5>Ngoài giày,
        chúng tôi còn cung cấp các phụ kiện thời trang như túi xách, đồng hồ, và trang sức,
        giúp bạn hoàn thiện phong cách của mình một cách tuyệt vời.
    <br></h5><h5><br></h5><h5>
        Đội ngũ nhân viên của chúng tôi luôn sẵn sàng hỗ trợ bạn trong quá trình mua sắm.
        Chúng tôi cam kết đem đến cho khách hàng những trải nghiệm mua sắm tuyệt vời, từ việc tìm kiếm sản phẩm đến việc đặt hàng và nhận hàng.
    </h5><p><br></p><h5>
        Hãy truy cập vào website của chúng tôi để khám phá thêm các sản phẩm giày và phụ kiện thời trang.
        Chúng tôi tin rằng, bạn sẽ tìm thấy những sản phẩm ưng ý và phù hợp với phong cách cá nhân của mình.
    </h5>
'

                    ],
                ]
            ]
        ];

        foreach ($databases as $database) {
            $recordNumber = DB::table($database['table'])->count();
            foreach ($database['data'] as $key => $record) {
                if ($key >= $recordNumber)
                    DB::table($database['table'])->insert($record);
            }
        }
    }
}
